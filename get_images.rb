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
end

filer = Filer.new
filepath = ARGV[0]
filer.download_by_file(filepath)