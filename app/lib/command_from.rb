module Command

  class From

    attr_reader :line

    def initialize(dockerfile, line)
      @dockerfile = dockerfile
      @line = line
    end

    def to_s
      @line
    end

  end

end