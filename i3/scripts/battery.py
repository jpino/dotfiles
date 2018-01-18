#!/usr/bin/env python3

from subprocess import check_output

res = check_output(['cat /sys/class/power_supply/BAT0/capacity  /sys/class/power_supply/BAT1/capacity'], shell=True)
txt = '% '.join(res.decode('UTF-8').split('\n')).strip()

print(txt)
