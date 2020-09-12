module Command

  class From

    def self.parse(dockerfile, line)
      self::new dockerfile, line
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