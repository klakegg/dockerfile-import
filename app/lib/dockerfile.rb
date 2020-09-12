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

  # Fetch original content of file without any parsing
  def as_include
    @lines
  end
  
  def to_s
    @lines.map { |l| l.to_s }.join "\n"
  end

end