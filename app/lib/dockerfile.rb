class Dockerfile

  attr_reader :dockerfiles, :path

  def initialize(dockerfiles, path)
    @dockerfiles = dockerfiles
    @path = path.realpath
    @lines = []

    # Read file content and parse into commands
    @path.readlines.map do |line|
      command = Command::parse self, line.gsub(/[\r\n]/, '')

      if command.is_a?(Array)
        @lines.append *command
      else
        @lines.append command
      end
    end
  end

  # Unparsed lines after initial import
  def unparsed
    @lines
  end

  # Parsed lines after doing advanced import
  def parsed
    @lines
  end
  
  def to_s
    parsed.map { |l| l.to_s }.join "\n"
  end

end