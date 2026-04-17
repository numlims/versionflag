# automatically generated, DON'T EDIT. please edit init.ct from where this file stems.
import importlib.metadata
import argparse
def flag(parser:argparse.ArgumentParser, module:str):
    """
     flag adds a version flag for module to the argument parser.
    """
    version = importlib.metadata.version(module)
    parser.add_argument("--version", help="print the program version", action="version", version=f"{module} version {version}")
