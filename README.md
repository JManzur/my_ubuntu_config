
# My Ubuntu - Ansible-Pull config

## Tested with: 

| Environment | Application | Version  |
| ----------------- |-----------|---------|
| LXC Ubuntu 20.04 | Git |  2.25.1  |
| LXC Ubuntu 20.04 | Ansible |  2.9.6  |

## Initialization How-To:

Download the [bootstrap.sh](https://raw.githubusercontent.com/JManzur/my_ubuntu_config/main/bootstrap.sh) script using wget, make it executable, and run it.

```bash
wget https://raw.githubusercontent.com/JManzur/my_ubuntu_config/main/bootstrap.sh
chmod +x bootstrap.sh
sudo ./bootstrap.sh
```

This script will install the latest updates, git and ansible.

## Deployment How-To:

Pull the repository and run it:

```bash
sudo ansible-pull -U https://github.com/JManzur/my_ubuntu_config.git
```

## Debugging / Troubleshooting:

#### **Debugging Tip #1**: 

#### **Known issue #1**: 
- **Issue**: You get a bunch of "[WARNING]" messages when running the playbook.
- **Cause**: This is a normal behavior form ansible-pull, the warning is about the host been declared as "localhost" instead of using a FQDN.
- **Solution**: You can ignore it or try to execute the command as follow: ```ansible-pull -i "$HOSTNAME" -U https://github.com/JManzur/my_ubuntu_config.git```

## Author

- [@jmanzur](https://github.com/JManzur)

## Documentation

- [Ansible-Pull Documentation](https://docs.ansible.com/ansible/latest/cli/ansible-pull.html)