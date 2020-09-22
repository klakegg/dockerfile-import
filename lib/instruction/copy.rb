module DockerfileImport

  module Instruction

    # Reference: https://docs.docker.com/engine/reference/builder/#copy
    class Copy

      def self.parse(line)
        # Copy from image
        if line.include? '--from='
          parts = line.split /\s+/, 3
          self::new parts[1][7..], parts[2]
    
        # Copy from disk
        else
          Line::new(line)
        end
      end

      def initialize(from, targets)
        @from = from
        @targets = targets
      end

      def as(name, names)
        if names.key? @from
          Copy::new "#{name}--#{@from}", @targets
        else
          self
        end
      end

      def to_s
        "COPY --from=#{@from} #{@targets}"
      end

    end

  end

end