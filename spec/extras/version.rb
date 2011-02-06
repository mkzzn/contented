require 'spec_helper'

describe Version do
  it "should print a pretty version number" do
    Version.print.should == [ Version::MAJOR, Version::MINOR, Version::MICRO ].join(".")
  end
end
