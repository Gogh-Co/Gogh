import json
import os
import sys
import shutil
import datetime
import re
import unicodedata

from configobj import ConfigObj


def printerr(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


def printout(*args, **kwargs):
    if not "GOGH_NONINTERACTIVE" in os.environ:
        print(*args, **kwargs)


def main(gogh_conf_theme):
    terminator_conf_file_path = get_terminator_conf_path()
    profile_options = choose_profile()
    update_terminator_conf(terminator_conf_file_path, gogh_conf_theme, profile_options)


def get_terminator_conf_path():
    try:
        configdir = os.environ['XDG_CONFIG_HOME']
    except KeyError:
        configdir = os.path.join(os.path.expanduser('~'), '.config')
    return(os.path.join(configdir, 'terminator/config'))


def update_terminator_conf(terminator_conf_file_path,gogh_conf_theme,profile_options):
    js = json.loads(gogh_conf_theme)

    config = ConfigObj(terminator_conf_file_path)
    backup_conf(terminator_conf_file_path)

    if profile_options["copy_default_config"] == 'yes':
        config['profiles'][profile_options["profile"]] = config['profiles']['default'].copy()
    elif profile_options["copy_default_config"] == 'no':
        config['profiles'][profile_options["profile"]] = {}

    use_theme_colors = False
    config['profiles'][profile_options["profile"]]['foreground_color'] = js['colors']['primary']['foreground']
    config['profiles'][profile_options["profile"]]['background_color'] = js['colors']['primary']['background']
    config['profiles'][profile_options["profile"]]['palette'] = js['colors']['pallete']
    config.write()
    printout('')
    printout('We’ve saved your profile! Close and open your terminal to see the changes!')


def choose_profile():
    profile_answer = ''
    copy_default_config_answer = ''

    if not "GOGH_NONINTERACTIVE" in os.environ:
        profile_answer = strip_accents(input("Enter profile to update/create [default]: ")).strip()
    if profile_answer.lower() in ['', 'default']:
        profile_answer = 'default'
    else:
        while True:
            copy_default_config_answer = input("Do you want to copy your config from default profile? [Y]: (Y/N) ").strip()
            if copy_default_config_answer.lower() in ['', 'yes', 'y']:
                copy_default_config_answer = 'yes'
                break
            elif copy_default_config_answer.lower() in ['no', 'n']:
                copy_default_config_answer = 'no'
                break
            else:
                printout("Ops... Type 'Y' or 'N'.")
    return {"profile": profile_answer, "copy_default_config": copy_default_config_answer}


def backup_conf(terminator_conf_file_path):
    now_str = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    backup_path = f'{terminator_conf_file_path}.{now_str}'
    shutil.copyfile(terminator_conf_file_path, backup_path)
    printout('')
    printout('Backup created at '+ backup_path)

def strip_accents(s):
   return ''.join(c for c in unicodedata.normalize('NFD', s)
                  if unicodedata.category(c) != 'Mn')

main(sys.argv[1])
