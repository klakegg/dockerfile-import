module Command

  class Copy

    attr_reader :line

    def self.parse(dockerfile, line) 
      if line.split(/\s+/).count == 3
        Command::Line::new(line)
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