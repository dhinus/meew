require "meew/cat_images"
require "fileutils"
require "open-uri"

class Meew
  def self.run(args)
    case args[0]
    when "browser" then browser
    when "file" then file
    when "fact" then not_implemented
    else print_usage
    end
  end

  def self.browser
    image_url = CatImages.get
    system("open #{image_url}")
  end

  def self.file
    puts "Finding a cat in the internets... (shouldn't be hard)"
    image_url = CatImages.get
    image_ext = /\.[a-z]+$/.match(image_url.downcase)
    file_path = File.expand_path("~/Desktop/cat#{image_ext}")

    puts "Writing #{file_path}"
    if File.exist?(file_path) then
      STDERR.puts "E_CATFIGHT: please remove the existing cat and try again!"
      exit 1
    else
      FileUtils.mkdir_p(File.dirname(file_path))
      File.open(file_path, 'wb') do |file|
        file << open(image_url).read
      end
    end
  end

  def self.print_usage
    puts "\nUsage: meew [command]"
    puts "\nAvailable commands:"
    puts "  browser    open a new browser window displaying an image of a cat"
    puts "  file       save on the desktop an image of a cat"
    puts "  fact       display a cat fact"
  end

  def self.not_implemented
    puts "\nThis command is not implemented yet"
  end
end
