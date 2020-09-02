require "./spec_helper"

describe TerminalTable do
  h = ["Name", "Age"]
  r = [
    ["Kourosh", 16],
    ["Dan", 34]
  ]
  t1 = TerminalTable::Table.new(rows: r)
  t2 = TerminalTable::Table.new(rows: r, enable_separator: false)
  t3 = TerminalTable::Table.new(rows: r, enable_separator: false, header: h)
  t4 = TerminalTable::Table.new(rows: r, header: h)
  describe "#row_line_component" do
    it "should return valid string" do
      [t1, t2].each do |t|
        t.row_line_component.should eq "+---------+----+"
      end
      [t3, t4].each do |t|
        t.row_line_component.should eq "+---------+-----+"
      end
    end
  end

  describe "#string_duplicate" do
    it "should return valid string" do
      t1.string_duplicate(0).should eq "" 
      t1.string_duplicate(3).should eq "   " 
    end
  end

  describe "#row_component" do
    it "should return valid row str" do
      t3.row_component(h, true).should eq "\n|  Name   | Age |" 
      t2.row_component(r[0], false).should eq "\n| Kourosh | 16 |"
      t1.row_component(r[0], false).should eq t1.row_line_component+"\n| Kourosh | 16 |\n"
      t4.row_component(h, true).should eq t4.row_line_component+"\n|  Name   | Age |\n"
    end
  end
end
