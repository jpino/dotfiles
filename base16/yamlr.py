import sys
import os
import re


for old_file_name in os.listdir('templatr'):
    with open('templatr/{}'.format(old_file_name), 'r') as old_file:
        f = old_file.read()
        f = re.sub('## Base16 (.+)', r'scheme: "\1"', f)
        f = re.sub('# Author: (.+)', r'author: "\1"', f)
        f = re.sub('set \$base(..) #(......)', r'base\1: "\2"', f)
        f = re.sub('#.*\n', r'', f)

        new_file_name = re.sub('\.config$', '.yaml', old_file_name)
        new_file_name = re.sub('^base16-', '', new_file_name)

        with open('schemes/{}'.format(new_file_name), 'w') as new_file:
            new_file.write(f)

