# Puppet-Hiera Control Repository
This is the control repository used by the Puppet master, which stores the main manifest site.pp as well as hiera data for specifying instance configuration.
## Understanding this repository
A few basics to get an understanding of how this repository is used:
* This repository is a control repo for puppet. Read on [how control repositories work](https://docs.puppet.com/pe/latest/cmgmt_control_repo.html)
* Deployment of this repository to the puppet master makes use of [r10k](https://github.com/puppetlabs/r10k)
* This repository also makes use of hiera for abstraction and specifying instance configuration using hiera_include.
  * Read on a basic overview of [hiera](https://docs.puppet.com/hiera/3.3/index.html)
  * Hiera is also used to configure instances with [hiera_include](https://docs.puppet.com/hiera/3.3/puppet.html#assigning-classes-to-nodes-with-hiera-hierainclude)
## Setting up the control repo
To use this repository, a running puppetmaster with r10k is required (r10k is included in the latest Puppet 4 package):

1. [Install puppetserver](https://docs.puppet.com/puppet/4.10/install_linux.html)
2. Create the r10k config file /etc/puppetlabs/r10k/r10k.yaml with the following contents (you might also need to create the directory)
```
# The location to use for storing cached Git repos
:cachedir: '/var/cache/r10k'

# A list of git repositories to create
:sources:
  # This will clone the git repository and instantiate an environment per
  # branch in /etc/puppetlabs/code/environments
  :puppet:
    remote: 'git@github.com:releaseph/puppet-hiera.git'
    basedir: '/etc/puppetlabs/code/environments'
```
3. Make sure that your puppetmaster can check out the control repository via SSH.
4. Deploy the control repo:
```
/opt/puppetlabs/puppet/bin/r10k deploy environment
```
5. Configure the puppetmaster's hiera_config to point to the necessary hiera.yaml
```
/opt/puppetlabs/bin/puppet config set --section master hiera_config '/etc/puppetlabs/code/environments/service/hiera.yaml
# service is an environment (branch) of the control repo, You can change this to your desired environment
```
6. Start puppetserver

If all steps succeed, you should now have a puppetmaster which uses this repository as a control repo.

## Post-install stuff
* If you have pushed changes to the control repo, you will need to redeploy with r10k to update puppetmaster.
```
/opt/puppetlabs/puppet/bin/r10k deploy environment
```
* If you made any changes to hiera.yaml, you will need to restart puppetmaster for the changes to apply.
