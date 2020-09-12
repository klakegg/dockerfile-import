module Command

  class Copy

    def self.parse(dockerfile, line)
      # Copy from disk
      if line.split(/\s+/).count == 3
        Command::Line::new(line)

      # Copy from image
      else
        self::new(dockerfile, line)
      end
    end

    def initialize(dockerfile, line)
      @dockerfile = dockerfile
      @line = line
    end

    def to_s
      @line
    end

  end

end