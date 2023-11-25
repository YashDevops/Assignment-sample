import os
import argparse
import glob

def parse_arguments():
    parser = argparse.ArgumentParser(description="Read content of all *.txt files in a directory and its subdirectories.")
    parser.add_argument('--directory', metavar='DIRECTORY', required=True, help='Path to the directory containing *.txt files')

    return parser.parse_args()

def read_txt_files(directory):
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith('.txt'):
                file_path = os.path.join(root, file)
                print(f"File Name: {file_path}")
if __name__ == "__main__":
    args = parse_arguments()
    directory_path = args.directory
    read_txt_files(directory_path)
