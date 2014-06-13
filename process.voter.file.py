#!/usr/bin/env python
import sys
import csv
from datetime import datetime

writer = csv.writer(sys.stdout, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
reader = csv.DictReader( sys.stdin )
first=True
#first=False
for line in reader:
    header = []
    row = []
    #print len(line)
    for item in line:
        header += [item]
        item1 = line[item].replace('\n','|')
        if 'timestamp' in item:
            #item1 = datetime.strftime(datetime.fromtimestamp(float(item1)),'%Y-%m-%dT%H:%M:%S-05:00')
            try:
                date = datetime.strptime(line[item],'%Y%m%d')
                row.append(datetime.strftime(date,'%Y-%m-%dT00:00:00-05:00'))
            except ValueError:
                row.append('')
        else:
            #row += [line[item]]
            row += [item1]
    if first:
        first=False
        writer.writerow(header)
    writer.writerow(row)

