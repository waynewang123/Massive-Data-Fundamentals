#!/usr/bin/env python
#
# This file has been provided as a starting point. You need to modify this file.
# Reads whole lines stdin; writes key/value pairs to stdout
# --- DO NOT MODIFY ANYTHING ABOVE THIS LINE ---

import sys
import re
import time

if __name__ == "__main__":
    for line in sys.stdin:
        for word in line.split():
            if re.match('\[\d\d/[a-zA-Z]{3}\/\d{4,}:\d\d:\d\d:\d\d\Z', word):
                date=time.striptime(word, '[%d/%b/%Y:%H:%H:%S')
                result=str(date.tm_year)
                result+='-'
                if(date.tm_mon<10):
                    result+='0'
                result+=str(date.tm_mon)
                sys.stout.write("{}\t1\n".format(result))
                    