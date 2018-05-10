module Definitions
 require_relative "extensions.rb"
  class HandyMethods < Tools
  	class << self
	  

	  def convert_arr_to_h(arr,_h)
		 arr.each_with_index{|_,k|_h.merge!("#{k+1}"=>_)}
		 return _h
	  end

	  def add_total_to_h(temp, x)
	    temp.each_with_index{|k,v| x["#{v+1}"].merge!("total" => k)}
	    return x
	  end

	  def process_grades(x)
	  	temp = []
	  	x.each do|k,v|
		 temp << Tools.check_grade(v["total"].to_i)
		end
		temp.each_with_index{|k,v| x["#{v+1}"].merge!("grade" => k)}
		return x
	  end

	  def print_report(x,temp)
	  	puts "ID | Subject1 | Subject2 | Subject3 | Subject4 | Grand­Total | Grade | Average­Compare"
		puts "------------------------------------------------------------------------------------"
		x.each{|k,v| puts "#{sprintf '%02d',k}  |    #{v["S1"]}    |    #{v["S2"]}    |    #{v["S3"]}    |    #{v["S4"]}    |    #{v["total"]}      |    #{v["grade"]}  | #{Tools.avg_comp(v["grade"],v["total"],temp)}" }
	  end

	  def make_grade_list(x,temp)
	  	list = Array.new
	  	x.each{|k,v| list << Tools.avg_comp(v["grade"],v["total"],temp) }
		list = list.group_by{|l| l }
	  end

	  def show_input_file_content(text)
	  	puts "------------------Input Data From File-----------------------\n\n"
	  	puts text
	  	puts "----------------------------------------------------\n\n\n"
	  end

	  def print_grade_report(temp,list)
	  	puts "------------------------------------------------------------------------------------\n\n"

		puts "Grade Report\n\n\n"

		puts "Number of students in A Grade :: #{temp["A"].count}\n\n"
		puts "Number of students in B Grade :: #{temp["B"].count}\n\n"
		puts "Number of students in C Grade :: #{temp["C"].count}\n\n"
		puts "Number of students above their grade average :: #{list["Above Average"].count}\n\n"
		puts "26 Number of students below their grade average :: #{list["Below Average"].count}\n\n"
		puts "--------------------------------------------------"
	  end

    end
  end
end