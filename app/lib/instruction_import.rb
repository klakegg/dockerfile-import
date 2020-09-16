module DockerfileImport

  module Instruction

    class Import

      def self.parse(file, line)
        parts = line.split(/\s+/)

        # Simple import
        if line.match /^IMPORT[\s]+([^\s]+)$/i
          (file.load parts[1]).unparsed

        # Advanced import
        elsif line.match /^IMPORT\s+([^\s]+)\s+AS\s+([^\s]+)$/i
          (file.load parts[1]).parsed parts[3]

        # Invalid instruction
        else
          raise "[#{file.path}] Invalid pattern: #{line}"
        end
      end

    end

  end

end