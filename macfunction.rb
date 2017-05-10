def sleepWifi(flg)
	#flg = ARGV[0]
	if flg == 1 then
		puts `networksetup -setairportpower en1 off`
		puts `sleep 1`
		puts `echo "Password@1"|sudo -S pmset sleepnow`
	elsif flg == 2 then
		puts `networksetup -setairportpower en1 on`
	elsif flg == 3 then
		puts `networksetup -setairportpower en1 off`
	end
end

def chpower(flg)
	#flg = ARGV[0]
	if (flg == 1) then
		
		puts "power mgm set to 6 minuts"
		
		puts `echo "Password@1"|sudo -S pmset displaysleep 6`
		puts `echo "Password@1"|sudo -S pmset sleep 15`
		
	else
		puts "power mgm set to 60 minuts"
		puts `echo "Password@1"|sudo -S pmset sleep 60`
		puts `echo "Password@1"|sudo -S pmset displaysleep 60`
	end

end

def disp() 

	msg = "Vol Name           Size  Free\n"
	
	list = `df -h`
	
	diskname = [ "/\\/dev\\/disk0s2/", "/\\/dev\\/disk0s6/","/\\/dev\\/disk0s5/","/\\/dev\\/disk0s4/","/\\/dev\\/disk1s2/","/\\/dev\\/disk3s2/", "/\\/dev\\/disk2s2/", "/\\/dev\\/disk4/"] 
	
	diskname.each{
	     |entry|
	
	     msgtmp = `echo "#{list}" | awk '#{entry}' #| awk '{print substr($0, 28)}'`
#	puts "---#{msgtmp}"
	     msg = msg + calColu(msgtmp)  + "\n"

}

	return msg.gsub("Gi", "G").gsub("\/Volumes\/", "").gsub("Mi", "M")

end

def calColu(size)

	diskName = size[45, size.length]
	
	diskName = diskName.chomp
	
	if (diskName == "/") then
		diskName = "/Volumes/Macintosh HD"
	end
	
	diskSize = size[12, 8]
	diskUsed = size[20, 7]
	diskAvail = size[27, 7]
	diskCapa = size[34, 6]
 
    return diskName.ljust(25) + calsize(diskSize).rjust(8) + calsize(diskAvail).rjust(7)  
end

def calsize(sizeOrg)

	size = sizeOrg[0, sizeOrg.length - 2]
	return (size.to_i * 1.024 * 1.024 * 1.024).to_i().to_s().rjust(4) + sizeOrg[sizeOrg.length - 2, sizeOrg.length]

end