
# Infra Utils - SSH Key Generator for Git

This repository contains a utility script to generate and configure SSH keys for Git. The script simplifies the process of creating a new SSH key, adding it to the SSH agent, and configuring it for use with GitHub.

## Script: `create_ssh_key_for_git.sh`

### Features
- Generates an SSH key using the `ed25519` algorithm.
- Adds the generated key to the SSH agent.
- Configures the SSH key in the `~/.ssh/config` file for GitHub.
- Provides instructions for using the generated key with Git.

---

## Usage

### Prerequisites
- Ensure you have `ssh-keygen` installed (comes pre-installed on most Unix-based systems).
- Ensure you have access to a terminal.

### Steps to Run the Script

1. **Clone the Repository** (if applicable):
   ```bash
   git clone <repository-url>
   cd infra-utils
   ```

2. **Make the Script Executable**:
   ```bash
   chmod +x create_ssh_key_for_git.sh
   ```

3. **Run the Script**:
   Provide a key name and email address as arguments:
   ```bash
   ./create_ssh_key_for_git.sh <key_name> <email>
   ```
   Example:
   ```bash
   ./create_ssh_key_for_git.sh my-key myemail@example.com
   ```

4. **Follow the Instructions**:
   - The script will generate an SSH key and configure it for GitHub.
   - It will display the location of the public key and instructions for using the alias.

---

## Example Output

After running the script, you will see output similar to the following:

```
To connect to a repository using this SSH key, use the alias 'github.com-my-key'.
For example, you can clone a repository like this:
git clone git@github.com-my-key:username/repository.git
You can find your public key at ~/.ssh/id_ed25519_my-key.pub
```

---

## Notes
- The script ensures that the SSH configuration is not duplicated if it already exists.
- The SSH agent is stopped after the script completes to avoid leaving it running unnecessarily.

---

## Troubleshooting
- If you encounter issues, ensure that the `~/.ssh` directory and `~/.ssh/config` file have the correct permissions:
  ```bash
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/config
  ```

- If the SSH key is not working, verify that it has been added to your GitHub account. You can find instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

---

## License
This script is provided as-is under the MIT License. Feel free to modify and use it as needed.
