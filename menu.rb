require "macfunction"
diskinfo = ""
while true
    system("clear")
    ind = 1
    puts "*******************************************"
    puts "* #{ind}. Press 'f' to launch foxpic           *"
    ind += 1
    puts "* #{ind}. Press 'i' to launch iMon             *"
    ind += 1
    puts "* #{ind}. Press 's' to sleep within 6 min      *"
    ind += 1
    puts "* #{ind}. Press 'l' to sleep within 60 min     *"
    ind += 1
    puts "* #{ind}. Press 'P' for sleep now              *"
    ind += 1
    puts "* #{ind}. Press 'w' for wifi on                *"
    ind += 1
    puts "* #{ind}. Press 'q' for wifi off               *"
    ind += 1
    puts "* #{ind}. Press 'u' for top command cpu        *"
    ind += 1
    puts "* #{ind}. Press 'r' for top command ram        *"
    ind += 1
    #puts "* #{ind}.Press 'r' for ramdisk                *"
    #ind += 1
    puts "* #{ind}.Press 'd' for disk info              *"
    ind += 1
    puts "* #{ind}.Press 'c' for CPU & Fan info         *"
    ind += 1
    puts "* #{ind}.Press 'e' for exit                   *"
    ind += 1
    puts "*******************************************"
#p `top -l 1 | awk '/PhysMem/' `


    puts ""
if diskinfo != "" then
    puts diskinfo
    diskinfo = ""
end
    print "Please input :"
    aa = gets()
    aa.chomp!
    if aa != "e"
        if aa == "f" then
            puts `sh ./foxpic.sh`
        elsif aa == "i" then
            puts `sh ./iMon.sh`
        elsif aa == "s" then
            chpower(1)
			#puts `ruby ./chpower.rb 1`
        elsif aa == "l" then
            chpower(2)
			#puts `ruby ./chpower.rb 2`
        elsif aa == "P" then
            sleepWifi(1)
        elsif aa == "w" then
            sleepWifi(2)
        elsif aa == "q" then
            sleepWifi(3)
        elsif aa == "rrt" then
            exec 'sh ./ramDisk.sh'
            break
        elsif aa == "u" then
            exec 'top -n 2 -ocpu;ruby menu.rb'
        elsif aa == "r" then
            exec 'top -n 2 -orsize;ruby menu.rb'
# awk '/PhysMem/' | awk '{print substr($0, 36, 14 ) } '`

        elsif aa == "d" then
            diskinfo = disp()#`ruby ./showDisk.rb`
			
        elsif aa == "c" then
			diskinfo = `./smc`
			
			ramd = `top -l 1 | awk '/PhysMem/' | awk '{print substr($0, index($0, \"active, \") + 8, index($0, \"inactive\") - index($0, \"active, \") ) } '` 
#puts "Ram:#{ramd}"
			ramd = ramd.gsub("inactive", "")
			diskinfo = diskinfo +  "Ram Inactive: #{ramd}"
        end
        sleep(1)
    else
	break
    end
end
