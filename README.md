# iPhotoStuff
Solution to the "iCloud full" problem on your iPhone - backing up photos to your disk instead of iCloud.

## Idea
Use google photos in "High Quality" (not "original") to view, search and share your photos. Keep the original size photos in on a storage of your choice. Use iCloud just as a staging area between your iPhone and your storage. 

## What to do if Your iCloud storage is full
### You need to have (Requirements)
 - not using moments
 - TODO

### Export iCloud
1. Open Google Photos on your iPhone and wait until all your photos and videos are backed up
1. Open Photos app on your Mac
  a. Wait to see "Updated Just Now" at the bottom. You will only see photos and videos that fit to your iCloud quota. If you have your iCloud full, typically the newest stuff won't appear here.
  a. Make sure you have Preferences -> iCloud -> iCloud Photos -> "Download Originals to this Mac" selected
  a. Select photos and videos from the beginning till a certain point time (ideally around the day when your iCloud was almost full, but still backing up)
  a. Export: File -> Export -> Export unmodified original. Use the following options
    * Export IPTC as XMP: no
    * File Name: Use File Name
    * Subfolder Format: Moment Name
    * Select a reasonable path to put your pictures to: e.g. `~/Downloads/iCloudpics`
    * Check the folder size (should be something close to 5G)
1. Make a backup, in case the script fails `cp -r iCloudpics/ iCloudpics-backup`
1. Run `./fix_directory_names.sh ~/Downloads/iCloudpics`
1. Copy the resulting directories to "mirrored/fotky/iPhone fotky", plus `iPhone fotky`
    * `rsync -auvh ~/Downloads/iCloudpics/ ~/iPhone\ fotky/`
    * `rsync -auvh /Users/petr/Downloads/iCloudpics/ /Volumes/APACER/mirrored/Fotky/iPhone\ fotky/`
    * rsync -auvh /Users/petr/Downloads/iCloudpics/ /Volumes/Slim/mirrored/Fotky/iPhone\ fotky/
1. delete the selected photos, agree it will be deleted on all devices
1. put your iPhone on the charger overnight and wait until iCloud syncs and photos disappear from your iphone. Never disable/enable iCloud sync, bad things will happen