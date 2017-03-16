#!/usr/bin/env python

import sys
import re

header_pattern = re.compile("^(##*) (.*)")

for arg in sys.argv:
    
    file = open(arg, "r")

    for line in file:

        matched = re.search(header_pattern, line)
        if matched == None:
            continue
        
        header_hashes = matched.group(1)
        level = len(header_hashes)
        if level >=4:
            continue
        
        text = matched.group(2).strip().translate(None, "*:")

        anchor = text.lower().replace(" ", "-").translate(None, "!?(),'\"")
        anchor = re.sub("^[0-9][0-9]*\.--*", "", anchor)
        link_target = arg + "#" + anchor
        full_link = "["+text+"]("+link_target+")"

        if level == 1:
            formatting = "### "
            indent = ""
        else:
            formatting = "- "
            indent = "  "*(level-2)

        if level == 1:
            print ""
            
        print indent + formatting + full_link
            
        if level == 1:
            print ""
        
    file.close()


