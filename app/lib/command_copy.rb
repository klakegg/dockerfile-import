module Command

  class Copy

    def self.parse(dockerfile, line)
      # Copy from image
      if line.split(/\s+/).count == 4 and line.include? '--from='
        parts = line.split /\s+/
        self::new dockerfile, parts[1][7..], parts[2], parts[3]
  
      # Copy from disk
      else
        Command::Line::new(line)
      end
    end

    def initialize(dockerfile, from, target_from, target_to)
      @dockerfile = dockerfile
      @from = from
      @target_from = target_from
      @target_to = target_to
    end

    def to_s
      "COPY --from=#{@from} #{@target_from} #{@target_to}"
    end

  end

end