module Command

  class Import

    def self.parse(dockerfile, line)
      parts = line.split(/\s+/)

      # Simple import
      if line.match /^IMPORT[\s]+([^\s]+)$/i
        (dockerfile.dockerfiles.get dockerfile.resolve parts[1]).unparsed

      # Advanced import
      elsif line.match /^IMPORT\s+([^\s]+)\s+AS\s+([^\s]+)$/i
        self::new dockerfile, line, dockerfile.resolve(parts[1]), parts[3]

      # Invalid instruction
      else
        raise "[#{dockerfile.path}] Invalid pattern: #{line}"
      end
    end

    def initialize(dockerfile, line, path, as)
      @dockerfile = dockerfile
      @line = line
      @path = path
      @as = as
    end

    def to_s
      "## #{@line}"
    end

  end

end