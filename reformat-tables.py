#!/usr/bin/env python

import sys
import os
import re

table_pattern = re.compile("\|")

for arg in sys.argv:

    if arg == sys.argv[0]:
        continue

    filename = arg
    file = open(filename, "r")

    new_filename = filename + ".new"
    new_file = open(new_filename, "w")
    
    for line in file:

        matched = re.search(table_pattern, line)
        if matched == None:
            new_file.write(line)
        else:
            new_file.write("| " + line)

    new_file.close()
    file.close()

    os.remove(filename)
    os.rename(new_filename, filename)



