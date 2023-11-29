# My Ubuntu - Ansible-Pull config

## Tested with: 

| Environment | Application | Version  |
| ----------------- |-----------|---------|
| LXC Ubuntu 22.04 | Git |  2.25.1  |
| LXC Ubuntu 22.04 | Ansible |  2.9.6  |

## Initialization How-To:

Download the [bootstrap.sh](https://raw.githubusercontent.com/JManzur/my_ubuntu_config/main/bootstrap.sh) script using wget, make it executable, and run it! :rocket:


:bulb: **TIP #1**: You can also use the following one-liner to execute the script directly from the web:

```bash
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/JManzur/my_ubuntu_config/main/bootstrap.sh)"
```

This script will install the latest updates, git and ansible.

## Deployment How-To:

Pull the repository and run it:

```bash
sudo ansible-pull -U https://github.com/JManzur/my_ubuntu_config.git
```

:bulb: **TIP #2**: If you just want to run it, when the repository changes use the "-o" flag as follows:

```bash
sudo ansible-pull -o -U https://github.com/JManzur/my_ubuntu_config.git
```

:bulb: **TIP #3**: If you want to automate a step further, you can add a crontab job to run an "ansible-pull" every 10 minutes using the "-o" flag, so it only applies when you make changes to the repository.

```bash
*/10 * * * * /usr/bin/ansible-pull -o -U https://github.com/JManzur/my_ubuntu_config.git > /dev/null
```

## Debugging / Troubleshooting:

#### **Known issue #1**: 
- **Issue**: You get a bunch of "[WARNING]" messages when running the playbook.
- **Cause**: This is a normal behavior form ansible-pull, the warning is about the host been declared as "localhost" instead of using a FQDN.
- **Solution**: You can ignore it or try to execute the command as follow: ```ansible-pull -i "$HOSTNAME" -U https://github.com/JManzur/my_ubuntu_config.git```

## Author

- [@jmanzur](https://github.com/JManzur)

## Documentation

- [Ansible-Pull Documentation](https://docs.ansible.com/ansible/latest/cli/ansible-pull.html)