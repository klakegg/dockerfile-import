module Command

  class Line

    attr_reader :line

    def initialize(line)
      @line = line
    end

    def to_s
      @line
    end

  end

end