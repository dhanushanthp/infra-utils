# Infra Utils

This repository contains utilities and scripts to simplify infrastructure-related tasks. Below is an overview of the available tools and their usage.

---

## Tools

### 1. SSH Key Generator for Git
Located in the `git/` directory, this script helps generate and configure SSH keys for GitHub.

#### Script: `create_ssh_key_for_git.sh`

**Features:**
- Generates an SSH key using the `ed25519` algorithm.
- Adds the key to the SSH agent.
- Configures the SSH key in the `~/.ssh/config` file for GitHub.
- Provides instructions for using the generated key with Git.

**Usage:**
```bash
cd git/
chmod +x create_ssh_key_for_git.sh
create_ssh_key_for_git.sh <key_name> <email>
```

**Example:**
```bash
create_ssh_key_for_git.sh my-key myemail@example.com
```

For more details, refer to the [README.md](git/README.md) in the `git/` directory.

---

### 2. VS Code Terminal Keeper Configuration
Located in the `vs_code_utils/` directory, this JSON file configures terminal sessions in Visual Studio Code.

#### File: `terminal_keeper.json`

**Features:**
- Defines terminal sessions with custom names, icons, and colors.
- Supports auto-execution of commands on startup.
- Allows multiple sessions to be grouped together.

**Usage:**
1. Install the Terminal Keeper extension in Visual Studio Code.
2. Place the `terminal_keeper.json` file in the appropriate configuration directory.
3. Customize the file as needed to suit your workflow.

---

## License
This repository is provided under the MIT License. Feel free to modify and use the scripts and configurations as needed.