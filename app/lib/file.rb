module Docker

  class File

    def initialize(loader, path)
      @loader = loader
      @path = path.realpath
      @lines = []

      # Read file content and parse into commands
      @path.readlines.map do |line|
        @lines.append *(Docker::Command::parse self, line.gsub(/[\r\n]/, ''))
      end
    end

    def load(path)
      if (@path.parent + path).exist?
        @loader.get @path.parent + path
      elsif (@path.parent + (path + '.df')).exist?
        @loader.get @path.parent + (path + '.df')
      else
        raise "Unable to find #{newpath}"
      end
    end

    # Unparsed lines after initial import
    def unparsed
      @lines
    end

    # Parsed lines after doing advanced import
    def parsed(name)
      names = {}
      @lines.map { |line| line.as name, names }
    end
    
    def to_s
      @lines.map { |l| l.to_s }.join "\n"
    end

  end

end