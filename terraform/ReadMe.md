
# Terraform Infrastructure Deployment

This repository contains Terraform configuration files for deploying infrastructure on Yandex.Cloud. The setup includes the creation of virtual machine instances and a Virtual Private Cloud (VPC) network.

## Summary

1. [Structure](#structure)
2. [Dependencies](#dependencies)
3. [Configuration Files](#configuration-files)
4. [Usage](#usage)
5. [Clean-Up](#clean-up)
6. [License](#license)

## Structure

    ├── backend.tf
    ├── LICENSE
    ├── main.tf 
    ├── modules 
    │   ├── tf-yc-instance 
    │   │   ├── main.tf 
    │   │   ├── outputs.tf 
    │   │   ├── ReadMe.md 
    │   │   ├── variables.tf
    │   │   └── versions.tf
    │   └── tf-yc-network
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── ReadMe.md
    │       ├── variables.tf
    │       └── versions.tf
    ├── outputs.tf
    ├── provider.tf
    ├── ReadMe.md
    ├── scripts
    │   └── user-data.yaml
    ├── terraform.tfvars
    ├── variables.tf
    └── versions.tf
    
    4 directories, 20 files
    
	
## Dependencies
Before using this Terraform configuration, ensure you have:

- Terraform installed (version >= 1.7.0)
- Yandex.Cloud provider plugin (version >= 0.87.0)
- Yandex.Cloud account with valid credentials
- Yandex Object Storage bucket for Terraform state (configured in `backend.tf`)

## Configuration Files

### `variables.tf`

This file defines variables used in the Terraform configuration. Update the default values according to your requirements.

- `cloud_id`: Cloud ID;
- `folder_id`: YC platform;
- `provider_zone`: Provider availability zone. Choose from: `"ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"`;
- `select_zone`: Set the zone for instances. Choose from the same list as `provider_zone`.

### `provider.tf`

This file configures the Yandex provider with the specified Cloud ID, Folder ID, and availability zone.

### `outputs.tf`

Defines outputs for the deployed infrastructure:

- `instance_ip_address`: IP address of the provisioned virtual machine instance;
- `instance_id`: ID of the virtual machine instance;
- `network_id`: ID of the created Yandex VPC network;
- `subnet_names`: List of subnet names in the default VPC network.

### `backend.tf`

Configures the Terraform backend to store state files in Yandex Object Storage.

### `versions.tf`

Specifies the required Terraform version and Yandex.Cloud provider version.

### `main.tf`

Defines the main Terraform modules:

- `yc-instance`: Deploys a virtual machine instance with user user-data, image, zone, subnet (subnet you can specify in file terraform.tfvars), and etc.
- `yc-network`: Creates a VPC network with subnets across different zones.

### `terraform.tfvars`

This file used in the Terraform infrastructure management tool to set variable values. Terraform allows you to define variables that can be used in your Terraform configuration file. For example, you can specify subnet and other params.

### Example of `./scripts/user-data.yaml`

```YAML
#cloud-config
users:
  - default
  - name: ansible
    gecos: ansible
    shell: /bin/bash
    sudo: 'ALL=(ALL) NOPASSWD:ALL'
    groups: user, admin
    lock_passwd: true
    create_home: true
    ssh_authorized_keys:
      - <paste SSH public key>
```
This YAML script is a cloud-config user data file, which is typically used for cloud-init initialization in cloud-based virtual machines. The provided user data defines a set of configurations for user creation and SSH key authorization.


## Usage

- Configure your Yandex.Cloud credentials:

1.Create IAM-token

```bash
yc iam create-token
```
2.Add to `$HOME/.bashrc` 

```bash
export YC_TOKEN=t1.9euelZrKisaNysaKmJWYl4qYmJ6Si-3rnpWanZyOy5....Ti6P
```

3.Create key_id and secret-key for service account to use S3-backet

```bash
yc iam access-key create --service-account-name <service_name-user>
```
4.Add to `$HOME/.bashrc` 

```bash
export ACCESS_KEY=YCAJE******************jG
export SECRET_KEY=YCOvqX7S3ASPawh*****************8qJrUZlq
```

- Initialize Terraform with `terraform init`
Or with using S3-backet: 
`terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"`

- Creat the changes plan with `terraform plan`

- Apply the configuration with `terraform apply`

- Review the changes and confirm the deployment.

## Clean-Up
To destroy the deployed infrastructure, run `terraform destroy` and confirm when prompted.

Note: Always exercise caution when destroying infrastructure to prevent data loss.


## License

MIT License

Copyright (c) [2024] [Nikita Semeniak]