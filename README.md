# Vagrant VM Setup

This is a Vagrant configuration for a development environment.

## Prerequisites
- VirtualBox
- Vagrant

## Usage

1. Start the VM:
   ```
   vagrant up
   ```

2. SSH into the VM:
   ```
   vagrant ssh
   ```

3. Stop the VM:
   ```
   vagrant halt
   ```

4. Delete the VM:
   ```
   vagrant destroy
   ```

## Configuration

- OS: Ubuntu 20.04 LTS
- RAM: 2GB
- CPUs: 2
- Port Forwarding: Host 8080 → Guest 80
- Shared Folder: Current directory → /vagrant

## Additional Information

Check the Vagrantfile for more configuration details.
