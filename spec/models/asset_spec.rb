require 'spec_helper'

describe Asset do
  before(:each) do
    @asset = stub_model(Asset).as_null_object
  end

  describe "helper methods" do
    describe "url" do
      it "should return the value for data.url" do
        data = mock("Data")
        data.stub! :url => "Banshees"
        @asset.stub! :data => data
        @asset.url.should == "Banshees"
      end
    end
    
    describe "file_name" do
      it "should return the value for data_file_name" do
        @asset.stub! :data_file_name => "snakes"
        @asset.file_name.should == "snakes"
      end
    end

    describe "content_type" do
      it "should return the value for data_content_type" do
        @asset.stub! :data_content_type => "snakes"
        @asset.content_type.should == "snakes"
      end
    end

    describe "file_size" do
      it "should return the value for data_file_size" do 
        @asset.stub! :data_file_size => "snakes"
        @asset.file_size.should == "snakes"
      end
    end
  end
end
