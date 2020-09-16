module Docker

  module Command

    def self.parse(file, line)
      if line.upcase.start_with? "IMPORT "
        Docker::Command::Import::parse file, line
      elsif line.upcase.start_with? "COPY "
        Docker::Command::Copy::parse line
      elsif line.upcase.start_with? "FROM "
        Docker::Command::From::parse file, line
      else
        Docker::Command::Line::new line
      end
    end

  end

end