module TerminalTable
  VERSION = "0.1.0"

  class Table

    @pattern : Array(Int32)

    def initialize(
        @rows : Array(Array(Int32 | String)), 
        @enable_separator : Bool = true, 
        @header : (Array(String)) = [] of String, 
        @corner_char : String = "+", 
        @row_char : String = "-", 
        @col_char : String = "|"
      )
      @pattern = get_lengthes()
    end

    def get_lengthes()
      index = @rows[0].size
      pattern = Array(Int32).new
      (0..index-1).each do |i|
        pattern.push @rows.map{|row| row[i].to_s.size}.max
      end
      return pattern if @header.empty?
      q = 0
      l = @header.map{|t| t.size}
      while q < pattern.size 
        if pattern[q] < l[q]
          pattern[q] = l[q]
        end
        q+=1
      end
      return pattern
    end

    def to_s
      string = ""
      if !@enable_separator && !@header.empty?
        string += row_line_component() unless @enable_separator
      end
      string += row_component(@header, true) 
      if !@header.nil? && !@enable_separator
        string += "\n"
        string += row_line_component() 
      end
      @rows.each do |row|
        string += row_component(row, false)
      end
      string += "\n" unless @enable_separator
      string += row_line_component()
    end

    def row_line_component() 
      str = @corner_char
      @pattern.each do |l|
        (l+2).times {str += @row_char}
        str += @corner_char
      end
      str
    end

    def string_duplicate(times) 
      str = ""
      times.times {str += " "}
      str
    end

    def row_component(row, is_header)
      string = ""
      unless row.empty?
        string += row_line_component() if @enable_separator
        string += "\n"
        i = 0
        while i < row.size
          col_length = @pattern[i]
          col = row[i]
          string += @col_char
          if is_header
            a = (col_length+2-col.to_s.size)/2
            if a.to_i == a
              first_escape = string_duplicate(a.to_i) 
              last_escape = first_escape
            else
              first_escape = string_duplicate a.to_i
              last_escape = string_duplicate a.to_i+1
            end
          else
            first_escape = " "
            last_escape = string_duplicate(col_length - col.to_s.size + 1)
          end
          string += first_escape
          string += col.to_s
          string += last_escape
          i+=1
        end
        string += @col_char
        string += "\n" if @enable_separator
      end
      string
    end
  end
end
