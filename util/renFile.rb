path = ARGV[0]
if path == nil
    puts "Please Input Path:"    
    path = gets.chomp 
end
path = path.rstrip.chomp
Dir.foreach(path) { 
  |entry|    
  slash = "/"
  subpath = path + slash + entry
  subpath = subpath.gsub("\\", "")
  if (entry.index(".") == nil) and not (File.directory? subpath) 
     File.rename( subpath,  subpath + ".jpg" )
     entry = entry + ".jpg"
     subpath = subpath + ".jpg" 
  end  

  if entry.index(".") == 0

  else
    if not (File.directory? subpath) and (entry.downcase.index(".jp") != nil) 

        ext = subpath[subpath.index("."), subpath.length]  
        newfile = subpath.gsub(ext, "_" + Time.now.strftime("%H%M%S") + ext)

        File.rename( subpath, newfile ) 
        puts "#{newfile} renamed." 
    end
  end
} 
