print "Please input path:"
path = gets()
path.chomp!
path = path.rstrip.gsub("\\", "")
Dir.foreach(path){
    |ent|
    if ent != "." and ent != ".." then
        pathO = path + "/" + ent
        pathS = pathO #.gsub("/", "\\/")
        awk1 = "awk 'gsub(/#{pathS}/, \"\")'"
        awk2 = "awk 'gsub(/\\t/, \"\")'"

        #p `du -sh #{pathS} | #{awk1} | #{awk2} ;find #{pathO} -type f | wc -l; echo \"       #{pathO}\"`
#puts pathO
        p `du -sh #{pathO} | #{awk2} ;find #{pathO} -type f | wc -l; echo \"       #{pathO}\"`
    end

}
