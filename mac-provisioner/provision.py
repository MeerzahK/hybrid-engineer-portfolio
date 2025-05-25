import argparse
from helpers.installer import install_apps
from helpers.system_checks import run_checks

def main():
    parser = argparse.ArgumentParser(description='Mac Provisioning CLI')
    parser.add_argument('--install-apps', action='store_true')
    parser.add_argument('--check-health', action='store_true')
    args = parser.parse_args()

    if args.install_apps:
        install_apps('config/apps.txt')
    if args.check_health:
        run_checks()

if __name__ == '__main__':
    main()