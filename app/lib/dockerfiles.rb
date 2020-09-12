class Dockerfiles

  def initialize
    @files = {}
  end

  def get(path)
    path = path.realpath

    if !@files.key? path
      @files[path] = Dockerfile::new self, path
    end

    @files[path]
  end

end