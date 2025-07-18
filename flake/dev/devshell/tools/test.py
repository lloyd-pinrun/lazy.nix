#!/usr/bin/env mix-shell
#!mix-shell -i python3 -p python3

import argparse
import os
import subprocess

from argparse import ArgumentParser, RawTextHelpFormatter
from subprocess import CompletedProcess
from typing import Any, List, Type

nix_command = (
    "nix" if os.environ["LAZY_NIX_COMMAND"] is None else os.environ["LAZY_NIX_COMMAND"]
)


class Success:
    pass


class Failure:
    pass


class ProgramArguments:
    group_size: int
    return_as_attr: bool
    return_as_list: bool
    session_is_interactive: bool
    nix_options: List = []
    system: str = os.environ["LAZY_SYSTEM"]
    tests: List = []


def main(args: ProgramArguments):
    if args.session_is_interactive:
        process: CompletedProcess = subprocess.run(["mk_test_list"])


def run_tests(args: ProgramArguments):
    for test in args.tests:
        print(f"checks.{args.system}.tests.entries.${test}", end="\n\n")

    if args.return_as_attr:
        print("Full attr path:")
        for test in args.tests:
            print(f"- {test}")
            exit(code=0)
    else:
        status = test_groups(args.group_size, args.tests, args.nix_options)

        returncode = 0 if status is Success else 1
        exit(code=returncode)


def test_group(group_slice, _nix_options: Any | None) -> Type[Success] | Type[Failure]:
    build: CompletedProcess = subprocess.run(
        [nix_command, "build", "--no-link."], capture_output=True
    )
    return Success if build.returncode == 0 else Failure


def test_groups(
    group_size: int, tests: List, nix_options: List
) -> Type[Success] | Type[Failure]:
    test_count = tests.__len__()
    group_size = test_count if group_size > test_count else group_size
    group_count = test_count / group_size

    failures = 0
    index = 0

    while index <= group_count:
        start_index = index * group_size
        group_slice = tests[start_index] if index == group_count else tests

        if group_count > 1:
            print(f"Testing group {index} of {group_count}")

        failures += 1 if test_group(group_slice, nix_options) else 0
        index += 1

    return Success if failures == 0 else Failure


if __name__ == "__main__":
    parser: ArgumentParser = ArgumentParser(
        prog="test",
        usage="%(prog)s [options] -- [nix-options]",
        description="Runs all tests or the given test files.",
        formatter_class=RawTextHelpFormatter,
    )

    parser.add_argument("tests", nargs="?", help="Specific tests to build and run.")
    parser.add_argument(
        "--list",
        "-l",
        dest="return_as_list",
        action="store_true",
        default=argparse.SUPPRESS,
        help="Returns a list of available tests.",
    )
    parser.add_argument(
        "--group-size",
        "-g",
        dest="group_size",
        type=int,
        nargs="?",
        default=20,
        help="The maximum number of tests to build at once. Default: 20",
    )
    parser.add_argument(
        "--interactive",
        "-i",
        dest="session_is_interactive",
        action="store_true",
        default=argparse.SUPPRESS,
        help="Interactively pick the tests to run. Mutually exclusive with tests provided to the command.",
    )
    parser.add_argument(
        "--attr",
        "-a",
        dest="return_as_attr",
        action="store_true",
        default=argparse.SUPPRESS,
        help="Prints the full attrpath of the tests, instead of running them.",
    )

    parser.add_argument(
        "--",
        dest="nix_options",
        nargs="*",
        help="Additional options to provide to `nix build`.",
    )

    system = os.environ.get("LAZY_SYSTEM")
    parser.add_argument(
        "--system",
        "-s",
        type=str,
        default=system,
        help=f"Launch test for the provided system, instead of {system}.",
    )

    program_args: ProgramArguments = parser.parse_args(namespace=ProgramArguments())

    main(program_args)
