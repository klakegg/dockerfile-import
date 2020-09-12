module Command

  class Include

    attr_reader :line, :lines

    def self.parse(dockerfile, line)
      if line.match /^INCLUDE[\s]+([^\s]+)$/i
        basefile = line.split(/\s+/)[1]

        content = dockerfile.dockerfiles.get dockerfile.path.parent + "#{basefile}.df"
        content.as_include
      else
        throw Error::new "Invalid pattern: #{line}"
      end
    end

  end

end