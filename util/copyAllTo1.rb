require "fileutils"

puts "Please input src path:"
srcPath = gets()
puts "Please input des path:"
desPath = gets()

srcPath.chomp!
srcPath = srcPath.gsub("\\", "")
desPath.chomp!
if (srcPath == "") then
    srcPath = "/Volumes/Toshiba64G/tmp/html"
    desPath = "/Volumes/Toshiba64G/tmp/new"
end

indx = 1
Dir.foreach(srcPath) {

    |entry|
    slash = "/"
    subSrcPath = srcPath + slash + entry
    if entry != "." and entry != ".."  
	if File.directory? subSrcPath
	    Dir.foreach(subSrcPath){
		|innerEntry|

		if innerEntry != "." and innerEntry != ".." 

		    innerPath = subSrcPath + slash + innerEntry
		    if not (File.directory? innerPath)

                        if innerEntry.index(".") == 0
                        else
			    if (innerPath.downcase.index(".jp") != nil) or (innerPath.downcase.index(".bmp") != nil)  
                                begin
			        puts "image file moved"

				newfilepath = desPath + slash + innerEntry
				
				if not (File.exist?(newfilepath))
	
				    FileUtils.cp( innerPath, newfilepath )
				else
                                                                        
				    newfilepath = desPath + slash + indx.to_s + "_" + innerEntry
				    indx = indx + 1  
				    FileUtils.cp( innerPath, newfilepath )
				end
                                rescue Exception => e1
                                    puts(e1)
                                end
			    end
			end
		    end
		end
	    }
       end
    end
}
