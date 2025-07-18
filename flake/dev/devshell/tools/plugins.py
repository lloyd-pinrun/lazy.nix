#!/usr/bin/env mix-shell
#!nix-shell -i pythoner3 -p python3

import argparse
import os
import re

from argparse import ArgumentParser, RawTextHelpFormatter

VALID_CATEGORIES = ["ai", "coding", "editor", "ui", "util"]

template = """
"""

path_template = "{root_dir}/{domain}/{category}/by-name/{name}/default.nix"

test_template = """
{{
  empty = {{
    plugins.{name}.enable = true;
  }};

  defaults = {{
    plugins.{name} = {{
      enable = true;
      settings = {{
        foo = "bar";
        bar.__raw = "function() print('foo') end";
      }};
    }};
  }};
}}
"""

test_path_template = "{root_dir}/tests/{domain}/{category}/by-name/{name}/default.nix"


class ProgramArguments:
    original_name: str
    pkg_name: str
    category: str
    is_dry_run: bool = False
    is_extra: bool = False
    remove: bool = False


def find_project_root(root_identifier="flake.nix") -> str | None:
    cwd = os.getcwd()
    while True:
        if root_identifier in os.listdir(cwd):
            return cwd

        parent_dirname = os.path.dirname(cwd)
        if parent_dirname == cwd:
            return None
        os.chdir("..")
        cwd = os.getcwd()


def main(args: ProgramArguments):
    # NOTE: validate `category`
    category = args.category
    if category not in VALID_CATEGORIES:
        print(
            f"Category is invalid, got: {args.category}, expected: {VALID_CATEGORIES}"
        )
        exit(code=1)

    # NOTE: kebab-case `original_name`
    name = re.sub(r"[\W_]+", "-", args.original_name).lower().strip("-")
    # pkg_name = args.pkg_name if args.pkg_name else name

    # NOTE: strip `"nvim"` from name (used for filename)
    name = re.sub(r"(^nvim-|-nvim$|^nvim$)", "", name).strip("-")

    root_dir = find_project_root()
    domain = "extras" if args.is_extra else "plugins"

    # NOTE: formats paths for the plugin and its corresponding test
    # plugin_path = path_template.format(
    #     root_dir=root_dir, domain=domain, category=category, name=name
    # )
    test_path = test_path_template.format(
        root_dir=root_dir, domain=domain, category=category, name=name
    )

    # NOTE: formats files for the plugin and its corresponding test
    # plugin = template.format(
    #     name=name, original_name=args.original_name, pkg_name=pkg_name
    # )
    test = test_template.format(name=name)

    if args.is_dry_run:
        divider = "-" * 42

        # print("Plugin:")
        # print(divider)
        # print(plugin_path)
        # print(plugin)
        # print(divider, end=("\n" * 3))

        print("Test:")
        print(divider)
        print(test_path)
        print(test)
        print(divider, end=("\n" * 3))

        exit(code=0)
    else:
        # # NOTE: creates plugin path & write
        # print("Writing plugin file...")
        # os.makedirs(os.path.dirname(plugin_path), exist_ok=True)
        # with open(plugin_path, "w") as file:
        #     file.write(plugin)

        # NOTE: creates test path & write
        print("Writing test file...")
        os.makedirs(os.path.dirname(test_path), exist_ok=True)
        with open(test_path, "w") as file:
            file.write(test)

        exit(code=0)


def create():
    return


def remove():
    return


if __name__ == "__main__":
    parser: ArgumentParser = ArgumentParser(
        prog="plugins",
        usage="%(prog)s [options]",
        description="Manage lazy.nix plugins & extras.",
        formatter_class=RawTextHelpFormatter,
    )

    parser.add_argument(
        "original_name",
        type=str,
        required=True,
        help="Original name of the new plugin.",
    )

    parser.add_argument(
        "-r",
        "--remove",
        action="store_true",
        default=argparse.SUPPRESS,
        help="Remove the plugin for the given name, rather than create it.",
    )

    parser.add_argument(
        "-c",
        "--category",
        type=str,
        required=True,
        help="The category of the new plugin.",
    )

    parser.add_argument(
        "-d",
        "--dry-run",
        dest="is_dry_run",
        action="store_true",
        default=argparse.SUPPRESS,
        help="Return the generated plugin files without actually writing.",
    )

    parser.add_argument(
        "-e",
        "--extra",
        dest="is_extra",
        action="store_true",
        default=argparse.SUPPRESS,
        help="""
        Specify whether the plugin is an `extra` or a core `plugin`.
        """,
    )

    parser.add_argument(
        "-p",
        "--package",
        dest="pkg_name",
        type=str,
        default=argparse.SUPPRESS,
        help="The package name of the plugin. Defaults to a kebab-cased version of its original name.",
    )

    args = parser.parse_args(namespace=ProgramArguments())

    main(args)
