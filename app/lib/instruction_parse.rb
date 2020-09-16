module DockerfileImport

  module Instruction

    def self.parse(file, line)
      if line.upcase.start_with? "IMPORT "
        Import::parse file, line
      elsif line.upcase.start_with? "COPY "
        Copy::parse line
      elsif line.upcase.start_with? "FROM "
        From::parse file, line
      else
        Line::new line
      end
    end

  end

end