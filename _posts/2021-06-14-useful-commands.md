---
image: "/assets/images/base/linux.svg"
category: Bash
---

Useful commands. <!--more-->

#### Change directory with `cd`

```bash
cd to/new/directory/
```

#### Remove file with `rm`

```bash
rm file.txt                        # Remove file.
rm -rf folder                      # Remove folder.
```

#### Move and renmae file with `mv`

```bash
mv file.txt other.txt              # Rename.
mv file.txt folder/file.txt        # Move to folder.
```

#### List files with `ls`

```bash
ls
ls -l                              # To view permissions.
```

#### Kill a process with `kill`

You get the process id (`<PID`) from `top` or `ps`.

```bash
kill <PID>
```

#### View running processes with `top` and `htop`

```bash
top
top -u trol                        # Filter on a single user.
htop                               # Nicer UI and some extra stuff.
```

#### View running processes with `ps`

```bash
ps
ps -u trol                        # Filter on a single user.
```

#### File System Disk Space with `df`

```bash
df
```

#### Pathname of the current working directory with `pwd`

```bash
pwd
```

#### No Hang Up with `nohup`

Start a command in the background and exit the subshell.

```bash
nohup <COMMAND> &
exit
```

You can now view the job running here:

```bash
jobs
```

#### Disk Usage with `du`

View the disk usage in the current directory.

```bash
du -h -d 1
```

#### File Tree with `tree`

View the file tree in the terminal up to a certain level.

```bash
tree -L 2
```

#### Run scheduled jobs with `cron`

A time based scheduler in unix. An hourly **cronjob** can look like this:

```bash
crontab -l
0 * * * * /bin/python /path/to/this/file.py
```

#### Create a tarball with `tar`

#### Transfer data from a URL with `curl`

Below will get you the HTML for Google:

```bash
curl www.google.com
```

#### Transfer data with `wget`

Below will get you the index file for Google:

```bash
wget www.google.com
```

#### Split and combine files with `split` and `cat`

`split` and `cat` can be used to split a file and concatentate it again.

```bash
# file.txt
a
b
c
d
e
f
g
```

Then use:

```bash
split -l 1 combined.txt splitted
cat splitted* > combined.txt
```

You can actually split a tarball and combine it again afterwards:

```bash
split combined.tar.gz splitted
cat splitted* > combined.tar.gz
```

Can be useful for file transfer if you have a very big tarball.

#### Global regular expression print with `grep`

Awesome tool for searching for text in files.

Search for a pattern in the current folder and optionally sub-directories.

```bash
grep <PATTERN> *
grep -r <PATTERN> *
```

#### Find and replace with `sed`

Replace all occurences of bash with linux in file.txt and redirect the output to `new_file.txt`

```bash
sed 's/bash/linux/g' file.txt > new_file.txt
```

#### Secure shell to a remote machine with `ssh`

`ssh` is useful for logging into a remote machine and execute commands on it.

I've found it useful to create a SSH tunnel when developing a `bokeh` server on a remote host.

```bash
ssh -NfL localhost:5006:localhost:5006 user@remote.host
```

#### Sync data with `rsync`

#### Mount a folder with `nfs`

#### JSON processing with `jq`

#### Download data from FTP server with `lftp`

#### Get the current user with `whoami`

```
whoami                                      # Outputs: trol
```

# References

[1] https://stedolan.github.io/jq/
