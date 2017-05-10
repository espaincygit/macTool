path = ARGV[0]
if path == nil
    puts "Please Input Path:"    
    path = gets.chomp 
end
path = path.rstrip.chomp
Dir.foreach(path) { 
  |entry| 
  
  if (entry != ".") and (entry != "..")
    
      fromfile = path + "/" + entry
      tofile = path + "/" + entry.gsub("-large.jpg-large", "")

      File.rename(fromfile, tofile ) 
  end

}
