require "meew/cat_images"
require "meew/cat_facts"
require "meew/tech_news"
require "fileutils"
require "open-uri"
require "moar-lolspeak"

class Meew
  def self.run(args)
    case args[0]
    when "browser" then browser
    when "file" then file
    when "fact" then fact
    when "news" then news
    else print_usage
    end
  end

  def self.browser
    image_url = CatImages.get
    system("open #{image_url}")
  end

  def self.fact
    puts CatFacts.get
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

  def self.news
    puts Moar::Lolspeak.translate(TechNews.get)
  end

  def self.print_usage
    puts "\nUsage: meew [command]"
    puts "\nAvailable commands:"
    puts "  browser    open a new browser window displaying an image of a cat"
    puts "  file       save on the desktop an image of a cat"
    puts "  fact       display a cat fact"
    puts "  news       CAN I HAS NEWZ?"
  end
end
