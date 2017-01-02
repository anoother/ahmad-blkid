#!/usr/bin/env python

import json
import re
import sys
from subprocess import check_output


output = {}
for partition in check_output('blkid').splitlines():
    partname = re.search('^/dev/(.+): ', partition)
    if not partname:
        continue
    attributes = re.finditer('([A-Z]+)="(.*?)"', partition)
    output[partname.group(1)] = {pair.group(1).lower(): pair.group(2) for pair in attributes}

print json.dumps(output, indent=4)

