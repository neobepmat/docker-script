# Configuring Gitlab to use SSH keys

- General rules and configuration to authenticating Gitlab with SSH keys
> https://docs.gitlab.com/ee/ssh/


## Sandbox

A new Group has been created, _Sandbox_, for testing purposes.

A new project has been created, _cla-playground_, for testing purposes

The project _cla-playground_ has been granted access to Developer group of users

## User configuration

- Users configuration
> New users should be added to Developer Gitlab group

- Generating new SSH key
> ssh-keygen -t ed25519 -C "ED25519 SSH Key for Gitlab"

- Copying generated SSH key (from user profile directory/.ssh)
> clip < <ssh public ssh key name>

- Gitlab --> Edit Profile --> SSH Keys
> copy and paste the public key

- adding the new SSH Key to SSH-Agent
> open a bash shell on .ssh folder
> run ssh-agent in background
> eval $(ssh-agent -s)
> add new ssh key
> ssh-add <new public ssh key>

## Cloning Repository

- clone _cla-playground_ repository
> git clone git@docker-01.cla.cl-grp.local:222/sandbox/cla-playground.git

- for Smartgit users
> ssh://git@docker-01:222/sandbox/cla-playground.git


## Users / Projects configuration

- Users must be granted to Group / Projects adding them via Gitlab UI to clone repo
- To push, a new branch should be created with user as _Maintaner_
