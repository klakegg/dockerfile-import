module Command

  def self.parse(dockerfile, line)
    if line.upcase.start_with? "IMPORT "
      Command::Import::parse dockerfile, line
    elsif line.upcase.start_with? "COPY "
      Command::Copy::parse dockerfile, line
    elsif line.upcase.start_with? "FROM "
      Command::From::parse dockerfile, line
    else
      Command::Line::new line
    end
  end

end