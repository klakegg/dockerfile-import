module Docker

  module Command

    class From

      def self.parse(file, line)
        parts = line.split(/\s+/)

        # FROM <image>
        if parts.count == 2
          self::new file, nil, parts[1], nil
        
        # FROM --platform=<platform> <image>
        elsif parts.count == 3
          self::new file, parts[1][11..], parts[2], nil
        
        # FROM <image> AS <name>
        elsif parts.count == 4 and parts[2].upcase == 'AS'
          self::new file, nil, parts[1], parts[3]

        # FROM --platform=<platform> <image> AS <name>
        elsif parts.count == 5 and parts[2].upcase == 'AS'
          self::new file, parts[1][11..], parts[2], parts[4]

        # Invalid instruction
        else
          raise "[#{file.path}] Invalid pattern: #{line}"
        end
      end

      def initialize(file, platform, image, name)
        @file = file
        @platform = platform
        @image = image
        @name = name
      end

      def to_s
        parts = ['FROM']

        if @platform != nil
          parts.append "--platform=#{@platform}"
        end

        parts.append @image

        if @name != nil
          parts.append 'AS', @image
        end

        parts.join ' '
      end

    end

  end

end