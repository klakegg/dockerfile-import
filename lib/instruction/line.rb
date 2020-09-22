module DockerfileImport

  module Instruction

    class Line

      def initialize(line)
        @line = line
      end

      def as(name, names)
        self
      end

      def to_s
        @line
      end

    end

  end

end