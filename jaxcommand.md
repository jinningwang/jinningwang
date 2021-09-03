# Common Command

## git
Daily work four steps:
```
git status
```
```
git add .
```
```
git commit -m "commit mesg"
```
```
git push
```

Sync changes:
```
git pull
```

Create **NewBranch** from **OriginalBranch**:
```
git checkout -b NewBranch OriginalBranch
```

Delete a branch:
```
git branch -d DeleteBranch
```

Roll back to a commit:
```
git reset --hard commit_ID
```

## linux
Add new user by super user:
```
sudo adduser newuser name
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
mkdir newdir
```

Delete a directory:
```
rmdir dirname
```

Delete a directory/file by force:
```
rm -rf dirname/filename
```

Change the owner of a direcoty:
```
chown new_owner dirname
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
docker stop container_ID
```
