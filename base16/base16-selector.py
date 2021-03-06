#!/usr/bin/python3

import yaml
import sys
import os
from jinja2 import Environment, FileSystemLoader, select_autoescape


def main(scheme, templates):
    try:
        with open(os.path.expanduser('~/dotfiles/base16/schemes/{}.yaml'.format(scheme)), 'r') as stream:
            colors = yaml.safe_load(stream)
    except:
        print('Scheme {} does not exist.'.format(scheme))
        sys.exit()

    env = Environment(
        loader=FileSystemLoader(os.path.expanduser('~/dotfiles/base16/templates')),
        autoescape=select_autoescape(['html', 'xml'])
    )

    print('Installing scheme {}...'.format(scheme))

    for t in templates:
        try:
            template = env.get_template('{}.j2'.format(t))
        except:
            print('Template {} does not exist.'.format(t))

        r = template.render(colors, slug=scheme)

        if t == 'neovim':
            neovim(r)
        elif t == 'bash':
            bash(r)
        elif t == 'sway':
            sway(r)
        # elif t == 'i3':
        #     i3(r)
        # elif t == 'dunst':
        #     dunst(r)
        elif t == 'swaynag':
            swaynag(r)

    print('Scheme {} installed successfully.'.format(scheme))




def neovim(config):
    path = os.path.expanduser('~/dotfiles/nvim/colors/automatic.vim')
    print("Writing neovim config file to {} ...".format(path))
    with open(path, 'w') as f:
        f.write(config)


def bash(config):
    path = os.path.expanduser('~/.config/automatic.shell')
    print("Writing bash config file to {} ...".format(path))
    with open(path, 'w') as f:
        f.write(config)

    os.system('/bin/bash {}'.format(path))


def sway(config):
    path = os.path.expanduser('~/dotfiles/sway/colors')
    print("Writing sway config file to {} ...".format(path))
    with open(path, 'w') as f:
        f.write(config)
    
    os.system('swaymsg reload')


# def i3(config):
#     print("Writing i3 config file...")
#     with open(os.path.expanduser('~/dotfiles/i3/base'), 'r') as file_base:
#         base = file_base.read()

#         with open(os.path.expanduser('~/dotfiles/i3/colors'), 'w') as file_colors:
#             file_colors.write(config)

#         with open(os.path.expanduser('~/dotfiles/i3/config'), 'w') as file_config:
#             file_config.write(config)
#             file_config.write(base)

#     os.system('i3-msg reload -q')

def swaynag(config):
    print("Writing swaynag config file...")
    with open(os.path.expanduser('~/dotfiles/swaynag/base'), 'r') as file_base:
        base = file_base.read()

        with open(os.path.expanduser('~/dotfiles/swaynag/colors'), 'w') as file_colors:
            file_colors.write(config)

        with open(os.path.expanduser('~/dotfiles/swaynag/config'), 'w') as file_config:
            file_config.write(base)
            file_config.write(config)


# def dunst(config):
#     print("Writing dunst config file... (to apply changes, restart dunst daemon with: sudo pkill dunst)")
#     with open(os.path.expanduser('~/dotfiles/dunst/base'), 'r') as file_base:
#         base = file_base.read()
# 
#         with open(os.path.expanduser('~/dotfiles/dunst/dunstrc'), 'w') as file_config:
#             file_config.write(base)
#             file_config.write(config)


if __name__ == "__main__":
    scheme = sys.argv[1]
    templates = sys.argv[2:]
    main(scheme, templates)
