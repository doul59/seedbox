# Seedbox
Container for running SickRage, CouchPotato and qBittorrent storing on Amazon Cloud Drive easily
(ACD provides unlimited storage for $60/year actually, with good performance) - My volume is "/drive"

- Clone this repos : `git clone https://github.com/doul59/seedbox.git`
- Build: `docker build -t seedbox`.  
- Put your oauth_data file into `<volume>/.cache/acd_cli/oauth_data  `
- Run: `docker run --rm -P --net=host  --cap-add SYS_ADMIN --device /dev/fuse  --security-opt apparmor:unconfined -v /drive:/root -it --name seedbox seedbox /initVolume.sh`  
- Run: `docker run -P --net=host  --cap-add SYS_ADMIN --device /dev/fuse  --security-opt apparmor:unconfined -v /drive:/root -itd --name seedbox seedbox /startDownloadSuite.sh` to start the apps. You can later attach to a bash waiting for you. 

### Addresses
- CouchPotato:5050 
- SickRage:8081 
- qBittorrent:8080

### Configuration  
Login to services to setup credentials  

### Notes  
Software is provided with default configuration :  
- `/root` is a volume  
- `/root/acd` is your ACD mount point  
- incomplete downloads go into `/root/downloads/incomplete`
- `/root/downloads/Movies|Shows` symlink to `/root/acd/Movies|temp`
- qBittorrents executes `/root/move.sh "%F" "/root/downloads/%L/"` at the end of download. It moves the download in `/root/downloads/<label>/` (retrying if the cloud drive throws errors)  
- SickRage will use qBittorrent, using `Shows` as label  
- SickRage looks for shows in `/root/acd/Shows`  
- SickRage renaming will occur for things in `/root/acd/temp`  
- CouchPotato will use qBittorrent, using `Movies` as label  
- CouchPotato renaming will occur for things in `/root/acd/Movies`
- CouchPotato has a patch for supporting magnets link with qBittorrent  

### TODO  
Fix an error from SickRage to qBittorrent when using anonymous authentication : SickRage get rejected by qBittorrent for too many bad requests (!)  
Actual workaround is to configure authentication  

