# Connect Git to Github account

- Checking for existing SSH keys
> $ ls -al ~/.ssh
> Lists the files in your .ssh directory, if they exist

- Generating a new SSH Key specifying mail address of your github account
> $ ssh-keygen -t ed25519 -C "operations.github@cl2001.it"

- Adding your SSH key to the ssh-agent
> start the ssh-agent in the background
> $ eval `ssh-agent -s`

- adding the private key
> ssh-add ~/.ssh/id_ed25519

- Copying the SSH public key to your clipboard.
> Linux:    clip < ~/.ssh/id_ed25519.pub
> Windows:  clip.exe < ~/.ssh/id_ed25519.pub

- Adding the public key to Github account
> click on your Profile --> Settings --> _SSH and GPG Keys_ --> New SS Key

# Commit to GitHub

> git config --global user.email "operations.github@cl2001.it"
> git config --global user.name "Operations GitHub"

> git add "modified-file"

# Push to GitHub

> git push
