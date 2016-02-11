require "meew/cat_images"

class Meew
  def self.run(args)
    case args[0]
    when "browser"
      image = CatImages.get
      system("open #{image}")
    when "file"
      not_implemented
    when "fact"
      not_implemented
    else
      print_usage
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
