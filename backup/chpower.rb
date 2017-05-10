flg = ARGV[0]
if (flg == "1") then

	puts "power mgm set to 6 minuts"
	
	puts `echo "Password@1"|sudo -S pmset displaysleep 6`
	puts `echo "Password@1"|sudo -S pmset sleep 15`

else
	puts "power mgm set to 60 minuts"
	puts `echo "Password@1"|sudo -S pmset sleep 60`
	puts `echo "Password@1"|sudo -S pmset displaysleep 60`
end


