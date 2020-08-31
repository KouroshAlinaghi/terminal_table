module TerminalTable
  VERSION = "0.1.0"

  class Table

    def initialize(
        @rows : Array(Array(Int32 | String)), 
        @enable_separator : Bool = true, 
        @header : (Array(String) | Nil) = nil, 
        @corner_char : String = "+", 
        @row_char : String = "-", 
        @col_char : String = "|"
      )
    end

    def to_s
      string = ""
      index = @rows[0].size
      lengthes = Array(Int32).new
      (0..index-1).each do |i|
        lengthes.push @rows.map{|row| row[i].to_s.size}.max
      end
      string += row_line_component(lengthes) unless @enable_separator
      string += row_component(lengthes, @header) 
      if !@header.nil? && !@enable_separator
        string += "\n"
        string += row_line_component(lengthes) 
      end
      @rows.each do |row|
        string += row_component(lengthes, row)
      end
      string += "\n" unless @enable_separator
      string += row_line_component(lengthes)
    end

    def row_line_component(lengthes) 
      str = @corner_char
      lengthes.each do |l|
        (l+2).times {str += @row_char}
        str += @corner_char
      end
      str
    end

    def string_duplicate(times) 
      "" if times == 0
      str = " "
      times.times {str += " "}
      str
    end

    def row_component(lengthes, row)
      string = ""
      unless row.nil?
        string += row_line_component(lengthes) if @enable_separator
        string += "\n"
        i = 0
        while i < row.size
          col_length = @rows.map{|row| row[i].to_s.size}.max
          col = row[i]
          string += @col_char
          first_escape = col_length - col.to_s.size % 2 == 0 ? string_duplicate(((col_length - col.to_s.size)/2).to_i) : " "
          last_escape = col_length - col.to_s.size % 2 == 0 ? first_escape : string_duplicate(col_length-col.to_s.size)
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
args = [
  ["kourosh", 15],
  ["ali", 123],
  ["amirmohammad", 0]
]
puts TerminalTable::Table.new(rows: args).to_s
