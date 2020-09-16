module DockerfileImport

  class File

    attr_reader :path

    def initialize(loader, path)
      @loader = loader
      @path = path.realpath
      @lines = []

      # Read file content and parse into commands
      @path.readlines.map do |line|
        @lines.append *(Instruction::parse self, line.gsub(/[\r\n]/, ''))
      end
    end

    def load(path)
      if (@path.parent + (path + '.df')).exist?
        @loader.get @path.parent + (path + '.df')
      elsif (@path.parent + path).exist?
        if (@path.parent + path).directory? and (@path.parent + (path + '/Dockerfile'))
          @loader.get @path.parent + (path + '/Dockerfile')
        else
          @loader.get @path.parent + path
        end
      else
        raise "Unable to find #{path}"
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