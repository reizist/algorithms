require 'open-uri'
require 'FileUtils'

class Filer
  DIR = "image/"

  def initialize
    #create dir
    FileUtils.mkdir_p(DIR) unless FileTest.exist?(DIR)
  end

  def download_image(url)
    file_name = File.basename(url)
    file_path = DIR + file_name

    #write image data
    if !FileTest.exist?(file_path)
      open(file_path, 'wb') do |output|
        open(url) do |data|
          output.write(data.read)
        end
      end
    end
  end

  def download_by_file(file_path)
    open(file_path) { |f|
      while line = f.gets
        download_image(line.chomp)
      end
    }
  end

  def create_file(file_path)
    open(file_path, "w").close()
  end

  def write_urllist(file_path,str)
    if !FileTest.exist?(file_path)
      create_file(file_path)
    end

    File::open(file_path, "a"){ |f|
      f.puts(str)
    }
  end
end

#filer = Filer.new
#filer.download_by_file("image/test.txt")
#filepath = ARGV[0]
#filer.download_by_file(filepath)