## Search for files

Basic concept to know:

* **Default behavior**:
  * The `find` command retreives both file and directory
  * Use the approprite `-type file` and `-type dictory` when appropriate
* **Permissions**
  * The `find -perm`  supports file modes on 4 bits (e.g 2644)
  * file modes in the 2000 range retrieves items with **SUID** bit configured.
  * file modes in the 4000 range retrieves items with **SGID** bit configured.
  * file modes in the 6000 range retrieves items with **SUID + SGID** bit configured.
