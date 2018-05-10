require'spec_helper'
require_relative '../lib/parser.rb'
include Definitions


RSpec.describe "Handy Methods", type: :request do
  let(:data) do
    array = [
     "S1-88,S2-53,S3-69,S4-64",
	 "S1-92,S2-86,S3-93,S4-77",
	 "S1-53,S2-59,S3-72,S4-59",
	 "S1-60,S2-52,S3-85,S4-62",
	 "S1-85,S2-53,S3-74,S4-61",
	 "S1-72,S2-91,S3-72,S4-89",
	 "S1-72,S2-71,S3-77,S4-91",
	 "S1-89,S2-60,S3-94,S4-59",
	 "S1-63,S2-61,S3-80,S4-57",
	 ",S1-86,S2-84,S3-65,S4-72",
	 ",S1-83,S2-25,S3-89,S4-89",
	 ",S1-65,S2-63,S3-65,S4-80",
	 ",S1-57,S2-56,S3-56,S4-59",
	 ",S1-60,S2-52,S3-77,S4-75",
	 ",S1-67,S2-56,S3-85,S4-62",
	 ",S1-75,S2-84,S3-61,S4-90",
	 ",S1-64,S2-53,S3-56,S4-77"]
  end


	describe "#it should test grades class" do
	  context "it should give desired result" do
	    
	    it "should return a formatted Hash" do
	     list = {}
	     x = HandyMethods.convert_arr_to_h(data,list)
	     expect(x).kind_of? Hash
	    end


	  end
	end
end