Is this a VM? 
Did you `sudo apt-get install open-vm-tools open-vm-tools-desktop` ?

`vmware-hgfsclient` lists shared folders

On Ubuntu 20.04:
`sudo /usr/bin/vmhgfs-fuse .host:/SHERED_FOLDER_NAME  ~/MNT_POINT  -o subtype=vmhgfs-fuse,allow_other`
