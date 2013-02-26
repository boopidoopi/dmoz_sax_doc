require 'spec_helper'

describe DmozSax::Path do
  it "takes a / delimited string in its initializer" do
    path = DmozSax::Path.new('This/Topic/Path')
    path.to_a.should == ['This','Topic','Path']
  end

  it "removes the 'Top' category and English index categories (e.g. 'a' to 'z')" do

    ('A'..'Z').each do |char|
      path = DmozSax::Path.new("Top/This/Topic/#{ char }/Path")
      path.to_a.should == ['This','Topic','Path']
    end
  end

  it "may optionally be preceeded by a name or identifier" do
    path = DmozSax::Path.new("Sample_Directory:Top/This/Topic/Path")
    path.name.should == 'Sample Directory'
    path.to_a.should == ['This','Topic','Path']
  end

  context "as an immutable array" do

    it "supports enumeration methods" do
      path = DmozSax::Path.new 'This/Topic/Path'
      path.length.should == 3
      path.count.should == 3
      path.size.should == 3

      path.each do |a| a.should_not be_nil end
      path.map {|a| a.downcase}.should == ['this','topic','path']
      path.inject(0) {|i,a| i += a.length}.should == 13
    end

    it "throws exceptions if modification attempted" do
      expect { path[0] = 'Bob' }.to raise_error
    end
  end
end
