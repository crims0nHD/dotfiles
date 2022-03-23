#!/usr/bin/env python3

# Dependencies: regex
# TODO: per-block options

import os, sys
import regex as re

# Read the file
file_str = ""
with open(sys.argv[1], "r") as f:
    file_str = f.read()

nfile_name=""
nfile_content=""

# Get the new file name
regex_name = r"(?<=#\+PROPERTY:.*?:tangle ).*?(?= |\n)"
matches_name = re.finditer(regex_name, file_str, re.MULTILINE | re.IGNORECASE | re.UNICODE)
for matchNum, match in enumerate(matches_name, start=1):
   nfile_name = match.group()

# Get the new file contents
regex_content = r"(?<=#\+begin_src.*?\n)(.|\n)*?(?=#\+end_src\n)"
matches_content = re.finditer(regex_content, file_str, re.MULTILINE | re.IGNORECASE | re.UNICODE)
for matchNum, match in enumerate(matches_content, start=1):
    nfile_content += match.group()

# Save new file
nfile_path = os.path.join(os.path.dirname(os.path.realpath(sys.argv[1])), nfile_name)
print("Writing to " + str(nfile_path))
with open(nfile_path, "w") as f:
    f.write(nfile_content)
