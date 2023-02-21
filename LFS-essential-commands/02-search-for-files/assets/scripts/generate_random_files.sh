#!/usr/bin/env bash

function install_dependencies()
{
    # install tgt and open-iscsi
    sudo apt-get update -y \
    && sudo apt-get install -y \
       'uuid-runtime' \
       'util-linux'
}

function create_lab1_files()
{
    # MODE
    mode[0]='0' # None
    mode[1]='1' # Execute
    mode[2]='2' # Write only
    mode[3]='3' # Write + Excecute
    mode[4]='4' # Read only
    mode[5]='5' # Read + Execute
    mode[6]='6' # Read + Write
    mode[7]='7' # Write + Read + Execute

    # SGID/SGIS
    sugid[0]='0' # None
    sugid[1]='2' # SUID
    sugid[2]='4' # SUID
    sugid[2]='6' # SUID + SGID

    # File size
    size[0]=32K
    size[1]=64K
    size[2]=128K
    size[3]=256K
    size[4]=512K
    size[5]=1024K

    # Attributes
    # A file with the 'a' attribute set can only be opened in append mode for writing.
    # Only the superuser or a process possessing the CAP_LINUX_IMMUTABLE capability can set or clear this attribute.
    attr[0]=+a
    attr[1]=-a
    # A file with the 'a' attribute set can only be opened in append mode for writing.
    # Only the superuser or a process possessing the CAP_LINUX_IMMUTABLE capability can set or clear this attribute.
    attr[2]=+i
    attr[3]=-i
    # A file with the 'd' attribute set is not a candidate for backup when the dump(8) program is run.
    attr[4]=+d
    attr[5]=-d
    # When a file with the 'A' attribute set is accessed, its atime record is not modified.
    # This avoids a certain amount of disk I/O for laptop systems.
    attr[4]=+A
    attr[5]=-A


    mkdir -vp /var/lib/lab1
    chmod -R 777 /var/lib/lab1

    for i in {1..1500}
    do
        u=$((RANDOM % ${#mode[@]}))
        g=$((RANDOM % ${#mode[@]}))
        o=$((RANDOM % ${#mode[@]}))
        s=$((RANDOM % ${#sugid[@]}))
        fmode="${mode[$s]}${mode[$u]}${mode[$g]}${mode[$o]}"
        
        z=$((RANDOM % ${#size[@]}))
        fsize="${size[$z]}"

        a=$((RANDOM % ${#attr[@]}))
        fattr="${attr[$a]}"

        fname="/var/lib/lab1/$(uuidgen)"
        
        fallocate -l ${fsize} ${fname}
        chmod ${fmode} ${fname}
        chattr ${fattr} ${fname}
    done
}

install_dependencies
create_lab1_files
