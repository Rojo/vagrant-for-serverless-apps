
# Serverless Development Environment on Vagrant

Configuration files to automatically set up a basic and customizable Vagrant box
with the required tools to develop serverless projects.

**Note**:

* Currently, the provision scripts only install development tools used for AWS
  Lambda, but it can be customized with your own provision script.


## Usage

0.- Install in your computer the software listed the prerequisites section.
1.- Clone the repository into your machine.
2.- Tweak the provider and options in the `Vagrantfile`.
3.- Run `vagrant up` and wait for the machine to be built.
4.- When the machine is ready, run `vagrant ssh` and `cd /vagrant`.
5.- [Start a new project][6] with the option `--path .`.


## Prerequisites

* [Vagrant][7]
* [Virtualbox][8] and the extension pack.

If you use a provider other than _Virtualbox_, be sure to change the
configuration on the `Vagrantfile`.


## Included Software

* **[CentOS][1]** (with Development Tools): This Linux distribution is closer
  to the one used on AWS Lambda has providers for virtualbox, libvirt, hyperv
  and vmware.

* **[Serverless][0]**: Framework to develop, provision and deploy serverless projects
  with support for AWS Lambda, Azure Functions, Google Cloud Functions, and IBM
  OpenWhisk.

* **Node.js 6.10** (with [NVM][2]): This runtime supports the Serverless framework
  and allows to write functions using just the JavaScript language. NVM manages
  the Node.js versions groups its packages.

* **Python 3.6** (with [Miniconda][3]): This distribution allows to build virtual
  development environments for Python application. With this, compiled Python
  dependencies can be easily included for Serverless Python Projects. (Python
  2.7 is available on system).

* **[AWS CLI][4]**: Tool to manage AWS services from the command line.

* **[direnv][5]**: This environment switcher automatically loads or unloads
  values as environment variables depending on the current directory.


---
[0]: https://serverless.com/
[1]: https://app.vagrantup.com/centos/boxes/7
[2]: https://github.com/creationix/nvm
[3]: https://conda.io/docs/test-drive.html
[4]: https://aws.amazon.com/cli/
[5]: https://direnv.net/
[6]: https://serverless.com/framework/docs/providers/aws/guide/quick-start/
[7]: https://www.vagrantup.com/
[8]: https://www.virtualbox.org/wiki/Downloads
