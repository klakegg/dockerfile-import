module Command

  class Import

    attr_reader :line

    def initialize(dockerfile, line)
      @dockerfile = dockerfile
      @line = line

      expanded = line.split(/\s+/)

      if line.match /^IMPORT[\s]+([^\s]+)$/i
        @content = dockerfile.dockerfiles.get dockerfile.path.parent + "#{expanded[1]}.df"
      elsif line.match /^IMPORT\s+([^\s]+)\s+AS\s+([^\s]+)$/i
        @content = dockerfile.dockerfiles.get dockerfile.path.parent + "#{expanded[1]}.df"
        @as = expanded[3]
      else
        raise "Invalid pattern: #{line}"
      end

    end

    def to_s
      "## #{@line}"
    end

  end

end