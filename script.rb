Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }

class Grades < Tools
  include Definitions
attr_reader :grades
	def initialize
	  @grades = {a:"A",b:"B",c:"C"}.freeze
	end

	def call	
		text = Tools.get_file_as_string("files/input/input.txt")
		filter_text = text.gsub!("\n",' ')
		array =  filter_text.gsub(/\s+/m, ' ').strip.split(" ")
		array.each{|a| a.slice!(0..1)}
		x = Hash.new
		temp = Array.new
		x = HandyMethods.convert_arr_to_h(array,x)
		x.each_with_index { |(key,value),index| x["#{index+1}"] = Tools.to_hash(value) }
		x.each_with_index { |(key,value),index| temp << x["#{index+1}"].values.inject(:+)}

		x = HandyMethods.add_total_to_h(temp,x)
		x = HandyMethods.process_grades(x)
		temp = {}

		grades.each{|k,v| temp["#{v}"] = Tools.avg_cal(x,v)}
		temp.each{|k,v| temp["#{k}"] = Tools.get_avg(v)}
		HandyMethods.show_input_file_content(text)
		list = HandyMethods.make_grade_list(x,temp)
		HandyMethods.print_report(x,temp)
		
		temp = []
		x.select {|k, v| temp << v["grade"] }
		temp = temp.group_by{ |name| name }
		HandyMethods.print_grade_report(temp,list)
	end
end
