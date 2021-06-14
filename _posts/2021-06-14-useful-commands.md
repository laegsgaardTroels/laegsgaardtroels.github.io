---
image: "/assets/images/base/linux.svg"
category: Bash
---

A few useful commands beyond the usual `cd`, `rm`, `mv`, `ls`, `pwd` etc.<!--more-->

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

#### Crontab

A time based scheduler in unix.

#### Split and combine files with `split` and `cat`

`split` and `cat` can be used to split a file and concatentate it again.

```
cat file_a.txt file_b.txt file_c.txt > file.txt
```

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
