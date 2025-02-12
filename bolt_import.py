from beet import DataPack, Context, Function
from bolt import Module
import re
from typing import List, Optional
import importlib.util

class ImportConverter:
    def __init__(self, root_path: str):
        self.root_path = root_path if ':' in root_path else root_path + ':'

    def beet_default(self, ctx: Context):
        def on_modules(modules):
            for key, module in modules.items():
                content = module.get_content()
                converted_content = self.find_and_convert_imports(content, key)
                if content != converted_content:
                    module.set_content(converted_content)

        on_modules(ctx.data[Function])
        on_modules(ctx.data[Module])

    def convert_reference(self, module: str, source_path: str) -> str:
        if module.startswith('@'):
            module = module.removeprefix('@')
            source_path_segments = re.split(r'[:/]', source_path)
            source_path_segments.pop()
            n = 0
            for _ in range(50):
                current_path = '/'.join(source_path_segments[1:])
                current_path = source_path_segments[0] + ':' + current_path
                if current_path == self.root_path:
                    break
                source_path_segments.pop()
                n += 1
            return ('./' if n == 0 else '../' * n) + module
        if module.startswith('.') or self.module_exists(module):
            return module
        return './' + module

    def module_exists(self, module_name: str) -> bool:
        return importlib.util.find_spec(module_name) is not None

    def find_and_convert_imports(self, code: str, source_path: str) -> str:
        def replace_import(match: re.Match) -> str:
            indent = match.group("indent")  # Capture the indentation
            module = match.group("module")
            converted_module = self.convert_reference(module, source_path)
            if match.group("alias") is None:
                return f"{indent}import {converted_module}"
            else:
                return f"{indent}import {converted_module} as {match.group('alias')}"

        def replace_from_import(match: re.Match) -> str:
            indent = match.group("indent")  # Capture the indentation
            module = match.group("module")
            imported_items = match.group("items")
            converted_module = self.convert_reference(module, source_path)
            return f"{indent}from {converted_module} import {imported_items}"

        # Updated regex to capture indentation
        import_pattern = re.compile(r"^(?P<indent>\s*)import\s+(?P<module>\S+)(?:\s+as\s+(?P<alias>\w+))?", re.MULTILINE)
        from_import_pattern = re.compile(r"^(?P<indent>\s*)from\s+(?P<module>\S+)\s+import\s+(?P<items>\S+(?:\s*,\s*\S+)*)", re.MULTILINE)

        code = import_pattern.sub(replace_import, code)
        code = from_import_pattern.sub(replace_from_import, code)

        return code

def beet_default(ctx: Context):
    root_path = ctx.meta.get('bolt_import')['root']
    converter = ImportConverter(root_path)
    converter.beet_default(ctx)