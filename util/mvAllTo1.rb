require "fileutils"

puts "Please input src path:"
srcPath = gets()
puts "Please input des path:"
desPath = gets()

srcPath.chomp!
desPath.chomp!
srcPath = srcPath.rstrip
desPath = desPath.rstrip

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
			    if innerPath.downcase.index(".jp") != nil or innerPath.downcase.index(".bmp") != nil 
			        puts "image file moved #{innerPath}"

					newfilepath = desPath + slash + innerEntry
				
				if not (File.exist?(newfilepath))
	
				    FileUtils.move( innerPath, newfilepath )
				else
                                                                        
				    newfilepath = desPath + slash + indx.to_s + "_" + innerEntry
				    indx = indx + 1  
				    FileUtils.move( innerPath, newfilepath )
				end
			  end
			end
		    end
		end
	    }
       else
           if entry.index(".html") != nil and File.exist?(subSrcPath)
               File.delete(subSrcPath)
	   end	
           if entry.downcase.index(".jp") != nil or entry.downcase.index(".bmp") != nil
               puts "image file moved #{entry}"
               newfilepath = desPath + slash + entry
               if not (File.exist?(newfilepath))
 
                   FileUtils.move(subSrcPath, newfilepath )
               else

                  newfilepath = desPath + slash + indx.to_s + "_" + entry
                  indx = indx + 1
                  FileUtils.move(subSrcPath, newfilepath )
               end

           end
       end
    end
}
