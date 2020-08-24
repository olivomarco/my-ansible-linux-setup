# Contributing

1. If you are contributing with a fix or an improvement to the code, please open a pull request directly.
2. If you are adding a functionality, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change. Generally speaking, functionalities that are related to the scope of the original playbook (setting up a simple and hardened Linux machine) are welcomed.
3. Always update the README.md with details of changes if needed.

Please note we have a [code of conduct](/CODE_OF_CONDUCT.md), please follow it in all your interactions with the project.

## More details on evolutions

When proposing a new functionality/evolutionary change, please consider that the scope of this playbook is to furnish anybody with a fast, easy to run playbook to setup a simple yet complete and hardened Linux machine.

If you are adding some software to the list of pre-installed softwares, please ensure that it is of general usage for a sysadmin and that it really has a widespread adoption in the community and in best sysadmin pratices.

If you are adding a role that does something (like, for instance, installing Docker) changes will be evaluated on a case-by-case basis by the maintainer and the community; however, please make sure that, like in the Docker example, there is a simple switch with a variable that makes the role optional.
