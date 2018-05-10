class Tools

 class << self
	
	  def get_file_as_string(filename)
	    data = ''
	    f = File.open(filename, "r") 
	    f.each_line do |line|
	    data += line
	    end
	    return data
	  end

	  def to_hash(str)
		Hash[
		  str.split(',').map do |pair|
		    k, v = pair.split('-', 2)
	         [k, v.to_i]
		   end
		]
	  end

	  def check_grade(marks)
	    if marks >= 340
		  "A"
		elsif (300..339).member?(marks)
		  "B"
		elsif marks < 300
		  "C"
		end
	  end

	  def avg_cal(_h,grade)
	   y = []
	    _h.each do|k,v|
		  if v["grade"] == grade  
		    y << v["total"]
 		  end  
 		end
 		return y
	  end

	  def get_avg(arr)
	  	arr.reduce(:+) / arr.size
	  end

	  def avg_comp(g,total,temp)
	  	if temp["#{g}"] < total
	  		"Below Average"
	  	else
	  		"Above Average"
	  	end

	  end

 end
end
