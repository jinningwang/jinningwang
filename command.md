# Common Command

## conda
Create an environment:
```
conda create --name env_name python=3.7
```

Install packages from a list:
```
conda install --file requirements.txt
```

If your Jupyter Notebook does not show kernel andes, try follow:
1. Acticate env andes:
```
source activate env_name
```

2. Install jupyter by:
```
conda install jupyter
```

3. Add kernel env_name into env by:
```
python -m ipykernel install --user --name env_name --display-name 'disp_name'
```

Insert a path to the sys path temporarily:
```
import sys
sys.append(new_path)
```

Insert a path to the sys path automatically:

Create a new_path.pth file that contains new_path (e.g. Users/admin/documents/work/new_pkg) in it.

Put the new_path.pth file under Python site-packages.

## git
Check current branch and status:
```
git status
```

Stash all changes:
```
git add .
```

Commit changes:
```
git commit -m "commit_msg"
```

Push commits to remote:
```
git push
```

Push commits to a new remote branch:
```
git push --set-upstream remote_name branch_name
```

Sync commits:
```
git pull
```

Revert modified files:
```
git checkout -f
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
git branch new_branch
```

Create **NewBranch** from **OriginalBranch**:
```
git checkout -b new_branch original_branch
```

Delete a branch:
```
git branch -d delete_branch
```

Roll back to a commit:
```
git reset --hard commit_ID
```

Add new remote:
```
git remote add remote_name remote_url
```

Add remote repo branches:
```
git fetch remot_ename
```

Merge a branch into current branch:
This is useful when you want to sync updates from source branch.
```
git merge source_branch
```

% TODO: explain what is and how to use
```
git rebase
```

% TODO: explain
```
git push --force
```
Allows you to override this rule: the commit history on the remote will be forcefully overwritten with your own local history. This is a rather dangerous process, because it's very easy to overwrite (and thereby lose) commits from your colleagues.

Reference:

[How to Use git push --force](https://www.git-tower.com/learn/git/faq/git-force-push/)

## linux
Add new user by super user:
```
sudo adduser newuser user_name
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
mkdir new_dir
```

Delete a directory:
```
rmdir dir_name
```

Delete a directory/file by force:
```
rm -rf dir_name/file_name
```

Change the owner of a direcoty:
```
chown new_owner dir_name
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

## SSH
Set key pair, so you don't need to input passwords everytime.

On Mac:
1. Generate public key. Run following command in `Terminal`:
```
ssh-keygen -t rsa
```

2. Import public key into SSH. Run the following command in `Terminal`:
```
ssh-copy-id user_name@host_name
```
In this step you will enter passphrase for the public key. If you do not want to use it, hit `Enter` to leave it blank.
