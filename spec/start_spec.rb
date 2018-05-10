require'spec_helper'

RSpec.describe "Starting Process", type: :request do
  let(:start_instance) do
    Grades.new
  end

  let(:read_file) do
  	Tools.get_file_as_string("files/input/input.txt")
  end

	describe "#it should test grades class" do
	  context "it should give desired result" do
	    
	    it "should be not be initialized nil" do
	      expect(start_instance).not_to be_nil
	    end

	    it "should be able to read text file" do
	    	expect(read_file).not_to be_nil
	    end

	  end
	end
end