module DockerfileImport

  # Class used for local caching
  class Loader

    def initialize
      @files = {}
    end

    def get(path)
      path = path.realpath

      if !@files.key? path
        @files[path] = File::new self, path
      end

      @files[path]
    end

  end

end