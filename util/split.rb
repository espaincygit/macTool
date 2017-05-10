require "fileutils"

puts "Please input src path:"
srcPath = gets()

srcPath.chomp!
srcPath = srcPath.rstrip.gsub("\\", "")

puts "Please input pathindex:"
pathindex = gets()
 
pathindex.chomp!
pathindex = pathindex.rstrip.gsub("\\", "")


indx = 1
Dir.foreach(srcPath) {

    |entry|
    slash = "/"
    subSrcPath = srcPath + slash + entry

    if entry != "." and entry != ".." and entry != ".DS_Store" and entry.index("_") == nil
        imgindex = 0
	newPath = subSrcPath + "_" + pathindex
	Dir.mkdir(newPath)
        Dir.foreach(subSrcPath){
	    |subentry|
          if subentry != "." and subentry != ".."
            if imgindex < 3000
                srcimage = subSrcPath + slash + subentry
                if File.exist?(srcimage)
                    FileUtils.move(srcimage, newPath )
                    imgindex = imgindex + 1
                end
                #puts  
            else
		break
            end
          end
        }
    end

}

