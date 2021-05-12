# Connect Git to Github account

- Checking for existing SSH keys
> $ ls -al ~/.ssh
> Lists the files in your .ssh directory, if they exist

- Generating a new SSH Key
> $ ssh-keygen -t ed25519 -C "your_email@example.com"

specifying mail address of github account

- Adding your SSH key to the ssh-agent
> start the ssh-agent in the background
> $ eval `ssh-agent -s`

add you private key
> ssh-add ~/.ssh/id_ed25519

- Copy the SSH public key to your clipboard.
> clip < ~/.ssh/id_ed25519.pub

- Add the public key to Github account

# Commit to GitHub

> git config --global user.email "giggiweb@yahoo.it"
> git config --global user.name "giuseppe grilli"

> git add "modified-file"

# Push to GitHub

> git push
