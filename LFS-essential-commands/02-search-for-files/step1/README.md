# Search and detroy file based on attributes

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

Discover files that are both group and world writable.

`find /var/lib/lab1 -type f -perm -go=w`

Now remove those files.

`find /var/lib/lab1 -type f -perm -go=w -exec rm -vf '{}' \;`

An error "Operation not permitted" is returned for some files. This might be caused by **extended attributes**.

Check the remaining files extended attributes.

`find /var/lib/lab1 -type f -perm -go=w -exec lsattr '{}' \;`

> Either the `i` (n. Immutable) or `a` (n. Append Only) attributes are displayed.

Unset the problematic extended attributes to the files.

`find /var/lib/lab1 -type f -perm -go=w -exec chattr -i -a '{}' \;`

Remove the problematic files.

`find /var/lib/lab1 -type f -perm -go=w -exec rm -vf '{}' \;`
