flg = ARGV[0]
if flg == "1" then
    p `networksetup -setairportpower en1 off`
    p `sleep 1`
    p `echo "Password@1"|sudo -S pmset sleepnow`
elsif flg == "2" then
    p `networksetup -setairportpower en1 on`
elsif flg == "3" then
    p `networksetup -setairportpower en1 off`
end
