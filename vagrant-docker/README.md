# containers/vagrant-docker

Uses Vagrant to provide a Docker cluster.

## Get started

The Vagrantfile defines five boxes - 1 x manager, 4 x workers - each using the ubuntu/xenial64 Vagrantbox. Provisioning is handled with `ansible_local`.

- `vagrant up manager`
- `vagrant up worker-1`
- `vagrant up worker-2`
