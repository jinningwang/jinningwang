
```
     ____.                _________                                           .___
    |    |____  ___  ___  \_   ___ \  ____   _____   _____ _____    ____    __| _/
    |    \__  \ \  \/  /  /    \  \/ /  _ \ /     \ /     \\__  \  /    \  / __ | 
/\__|    |/ __ \_>    <   \     \___(  <_> )  Y Y  \  Y Y  \/ __ \|   |  \/ /_/ | 
\________(____  /__/\_ \   \______  /\____/|__|_|  /__|_|  (____  /___|  /\____ | 
              \/      \/          \/             \/      \/     \/     \/      \/ 
```

# Common Command

## ANDES
Install ANDES as Development Mode:
```
python3 -m pip install -e .
```

Uninstall ANDES

If install by conda:
```
conda remove andes --force
```

If install by pip3:
```
pip uninstall andes
```

Selftest:
```
andes selftest
```

Code generation:
```
andes prepare
```


Code generation by incremental:
```
andes prepare -i
```

Code generation bu full:
```
andes prepare -f
```

## git
Daily work four steps:
```
git status
```
```
git add .
```
```
git commit -m "<commit mesg>"
```
```
git push
```

Sync changes:
```
git pull
```

List out local branches:
```
git branch
```

List out all branches (including remotes):
```
git branch -a
```

Create **NewBranch** from **CurrentBranch**:
```
git branch <NewBranch>
```

Create **NewBranch** from **OriginalBranch**:
```
git checkout -b <NewBranch> <OriginalBranch>
```

Delete a branch:
```
git branch -d <DeleteBranch>
```

Roll back to a commit:
```
git reset --hard <commit_ID>
```

Add new remote:
```
git remote add <remot_ename> <remote_url>
```

Add remote repo branches:
```
git fetch <remot_ename>
```

## linux
Add new user by super user:
```
sudo adduser newuser <user_name>
```

List out directories/files:
```
ls
```

List out all directories/files:
```
ls -a
```

List out all directories/files, and their owner, group and access:
```
ls -l
```

Create new directory:
```
mkdir <newdir>
```

Delete a directory:
```
rmdir <dirname>
```

Delete a directory/file by force:
```
rm -rf <dirname/filename>
```

Change the owner of a direcoty:
```
chown <new_owner> <dirname>
```

## tmux
Open tmux:
```
tmux
```

List out all tmux panels:
```
tmux ls
```

Terminate all tmux panels:
```
tmux kill-server
```

## docker
List all containers:
```
docker ps
```

Kill all containers:
```
docker kill $(docker ps -q)
```

Stop a container:
```
docker stop <container_ID>
```

## SSH
Set key pair, so you don't need to input passwords everytime.

On Mac:
1. Generate public key. Run following command in `Terminal`:
```
ssh-keygen -t rsa
```

2. Import public key into SSH. Run the following command in `Terminal`:
```
ssh-copy-id <username>@<hostname>
```
In this step you will enter passphrase for the public key. If you do not want to use it, hit `Enter` to leave it blank.
