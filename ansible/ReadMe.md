
# Terraform Infrastructure Deployment

This repository contains Terraform configuration files for deploying infrastructure on Yandex.Cloud. The setup includes the creation of virtual machine instances and a Virtual Private Cloud (VPC) network.

## Summary

1. [Structure](#structure)
2. [Roles](#roles)
3. [Configuration Files](#configuration-files)
4. [Usage](#usage)
5. [License](#license)

## Structure


    ├── ansible.cfg
    ├── group_vars
    │   ├── all.yaml
    │   ├── backend.yaml
    │   └── frontend.yaml
    ├── inventory.yaml
    ├── LICENSE
    ├── playbook.yaml
    ├── ReadMe.md
    └── roles
        ├── backend
        │   ├── tasks
        │   │   └── main.yaml
        │   └── templates
        │       └── sausage-store-backend.service.j2
        └── frontend
            ├── tasks
            │   └── main.yaml
            └── templates
                └── sausage-store-frontend.j2

    8 directories, 12 files



	
## Roles

### Role: backend

| Task  | Description  |
| ------------ | ------------ |
| Update apt packages  | Uses Ansible's apt module to update the package cache. |
| Install packages | Installs required software packages specified in the `backend_required_soft` variable  |
| Create user | Creates a user with the specified username and shell  |
| Create directories | Creates necessary directories for the backend application  |
| Download artifact | Retrieves the backend application artifact from the specified Nexus repository using Maven  |
| Create symbolic link for jar file  | Establishes a symbolic link to the downloaded JAR file  |
| Unit service creation  | Uses a Jinja template to create a systemd unit file for the backend service  |
| Daemon reload  | Reloads systemd after unit file creation  |
| Run application | Restarts the backend service  |


### Role: frontend

| Task  | Description  |
| ------------ | ------------ |
| Collect selected facts  | Generates information about the distribution release |
| Add gpg-key for nodejs repo | Adds the GPG key for the Node.js repository  |
| Add nodejs repo | Adds the Node.js repository to the system  |
| Install Nodejs | Installs Node.js using from apt  |
| Create user | Creates a user with the specified username and shell |
| Create directories | Creates necessary directories for the frontend application  |
| Download artifacts | Retrieves the frontend application artifacts from the specified Nexus repository  |
| Extract artifacts archive  | Unarchives the downloaded artifacts to the specified destination  |
| Install Nginx | Installs Nginx from apt |
| Copy Nginx site configuration | Uses a Jinja template to create an Nginx site configuration file |
| Enable Nginx site | Creates a symbolic link to enable the Nginx site with frontend  |
| Remove default Nginx site | Removes the default Nginx site configuration  |
| Enable Nginx service  | Enables the Nginx service using systemd  |
| Restart Nginx service | Restarts the Nginx service |


## Configuration Files


### `ansible.cfg`

```SHELL

[defaults]
roles_path = roles
inventory = inventory.yaml
remote_user = ansible
host_key_checking = False
ConnectTimeout = 30
vault_password_file = .vault
[inventory]
enable_plugins = yaml

```

Note: exist the `.vault` file with pass phrase


## Usage

To deploy project on VM use this command

```bash
ansible-playbook -vv playbook.yaml
```

## License

MIT License

Copyright (c) [2024] [Nikita Semeniak]
