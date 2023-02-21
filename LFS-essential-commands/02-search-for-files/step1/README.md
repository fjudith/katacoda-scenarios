# Counting files

By default the find command is recursive.

Retreive the full path where the `lab1` files are located.
It is preferable to run the command as `root` to avoid the noise of permission warnings.

`sudo find / -name *lab1*`

Count the number of files in the `lab1` directory.

`ls /var/lib/lab1 | wc -l`

Do the same with the find command.

`find /var/lib/lab1 | wc -l`

> Notice the result does not match the previous command because find process both files **and directories**

Fix the command to only retreive files

`find /var/lib/lab1 -type f | wc -l`
