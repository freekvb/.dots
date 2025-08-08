# ssh_agent


#### adding your SSH key to the ssh-agent

- before adding a new SSH key to the ssh-agent to manage your keys, you should
    have checked for existing SSH keys and generated a new SSH key.
- start the ssh-agent in the background.

> $ eval "$(ssh-agent -s)" and then at the cmd-prompt .. > Agent pid 59566

add your SSH private key to the ssh-agent. if you created your key with a different
name, or if you are adding an existing key that has a different name, replace
id_ed25519 in the command with the name of your private key file.

> $ ssh-add ~/.ssh/id_ed25519

add the SSH key to your GitHub account.

