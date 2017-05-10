require "fileutils"

#desPath = "/Volumes/Toshiba64G/tmp/html" #ARGV[1]
puts "Input folder:"

srcPath = gets.chomp #"/Volumes/Toshiba64G/tmp/html" #ARGV[0]

#srcPath = "/Volumes/Toshiba64G/tmp/new"
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
                            if File.exist?(innerPath)
			        puts "find hidden " + innerPath
                                File.delete(innerPath)
			    end
			end
		    end
		end
	    }
	else
	    if entry.index(".") == 0 or entry.index(".html") != nil
                if File.exist?(subSrcPath)
                
		    puts "hidden" + subSrcPath
		    File.delete( subSrcPath)
	        end
	    end
	end
    end
}
