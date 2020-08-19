# Perfect Linux machine setup with Ansible

In 2020, having a Linux IaaS machine configured and setup should be easy and fast: after all, it's the basic task anybody has to do in order to start working on more-meaningful and productive activities.

However, this is not always the case: you work in different environments (different cloud providers, on-premises environments, lab environments) where you have different base images and different tools, and creating the very same machine is still quite a daunting - or at least *time-consuming* - task.

This project aims to solve that, by providing a **boilerplate yet complete** and **easy-to-use** and **easy-to-customize** way to spin up your own Linux machine.

## Usage

You will need [Ansible](https://ansible.com) on your workstation in order to run this project, and you will need to first install a base Linux image on your target system. The target system can be a Debian-based system or an Ubuntu-based system, since the [apt](https://it.wikipedia.org/wiki/Advanced_Packaging_Tool) package is used.

You can start the fun with the [install.sh](/install.sh) script which takes in input the hostname to configure.

In the output, you will receive the passwords for the default user and the `root` user.
The script will add your local SSH keys as trusted keys for remote login, and will harden the Linux installation quite a bit.
In the end, you will also have several utilities installed and a Docker daemon.

The playbook also uses the [olivomarco/dotfiles](https://github.com/olivomarco/dotfiles) repo in order to setup a custom and productive shell for the users of the system.

## Parameters

Please note that some of the parameters provided by this template repo **MUST BE CHANGED** before running the script.

Customization starts by modifying files in [this folder](/group_vars/). In particular, consider that:

- in [all.yml](/group_vars/all.yml) you must modify the `default_username` variable
- in [all.yml](/group_vars/all.yml) you must modify the `dot_forward_email` variable
- the [vault.yml](/group_vars/vault.yml) is an [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html) encrypted file (default password: `secretpassword`) which you must customize with your SMTP parameters

## Final notes

You can, of course, customize everything and add your own tools and configurations: **if you think you have found something useful which can be beneficial to any user using this package, please open a feature request and I will gladly evaluate it**.
