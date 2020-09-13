module Docker

  class File

    attr_reader :loader, :path

    def initialize(loader, path)
      @loader = loader
      @path = path.realpath
      @lines = []

      # Read file content and parse into commands
      @path.readlines.map do |line|
        @lines.append *(Docker::Command::parse self, line.gsub(/[\r\n]/, ''))
      end
    end

    def resolve(path)
      if (@path.parent + path).exist?
        @path.parent + path
      elsif (@path.parent + (path + '.df')).exist?
        @path.parent + (path + '.df')
      else
        raise "Unable to find #{newpath}"
      end
    end

    # Unparsed lines after initial import
    def unparsed
      @lines
    end

    # Parsed lines after doing advanced import
    def parsed
      @lines
    end
    
    def to_s
      parsed.map { |l| l.to_s }.join "\n"
    end

  end

end