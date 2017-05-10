sleep 2
cd /Users/espaincyjp/myapp
diskutil erasevolume HFS+ "RamDisk" `hdiutil attach -nomount ram://512000`

if [ -d "/Volumes/RamDisk" ]; then 
    echo "/Volumes/RamDisk found.";
    echo "Password@1"|sudo -S rm -rf ~/Library/Caches -y;
    echo "Password@1"|sudo -S /Applications/Privoxy/stopPrivoxy.sh -y;
    ln -s /Volumes/RamDisk/ ~/Library/Caches;
#    ./startdiskToRam.sh;
    cp -R "/Volumes/Macintosh BAK/foxpic" /Volumes/RamDisk
    rm /Volumes/RamDisk/foxpic/setting.config
    ./foxpic.sh
    ./iMon.sh
    #./chpower.sh 60
    ruby ./menu.rb
else
    echo "/Volumes/RamDisk not found.";
    #echo "Password@1"|sudo -S rm -rf ~/Library/Caches -y;
    #ln -s "/Volumes/Macintosh TMP2/Rdisk/" ~/Library/Caches
fi


