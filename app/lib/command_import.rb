module Docker

  module Command

    class Import

      def self.parse(file, line)
        parts = line.split(/\s+/)

        # Simple import
        if line.match /^IMPORT[\s]+([^\s]+)$/i
          (file.loader.get file.resolve parts[1]).unparsed

        # Advanced import
        elsif line.match /^IMPORT\s+([^\s]+)\s+AS\s+([^\s]+)$/i
          self::new file, line, file.resolve(parts[1]), parts[3]

        # Invalid instruction
        else
          raise "[#{file.path}] Invalid pattern: #{line}"
        end
      end

      def initialize(file, line, path, as)
        @file = file
        @line = line
        @path = path
        @as = as
      end

      def to_s
        "## #{@line}"
      end

    end

  end

end