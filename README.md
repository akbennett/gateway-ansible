# Gateway Ansible Setup Scripts

Ansible scripts to setup your microPlatform

1. add systemd service
2. copy personality file from /targets
3. run the agent (which will use target personality)

## Setup your host

### Ubuntu/Debian

```
apt -y install ansible
```

### Mac OS X

```
brew install ansible
```

## Deploy your SSH public key

Make sure to setup your SSH public key before calling ansible:

```
ssh-copy-id <gateway host>
```

## Execute

Add the appropriate target to the targets directory
```
./microPlatform.sh gateway
```
