class	String
	def is_upper?
	    self == self.upcase
	end

	def is_lower?
	    self == self.downcase
	end


def ceasar_cipher (x,y)
	#establishing the upper and lowercase alphabets along with values for each upper and lower hash
	alphabetLower = ('a'..'z').to_a
	values = (0..26).to_a
	alphabetHashLower = {} #establish the lowercase hash
	alphabetLower.each_with_index do |key, i|
		alphabetHashLower[key] = values[i]
	end
	alphabetUpper = ('A'..'Z').to_a #establish the uppercase hash
	alphabetHashUpper = {}
	alphabetUpper.each_with_index do |key, i|
		alphabetHashUpper[key] = values[i]
	end
	#check the capitalization of the letter
	if x.is_upper?
		value = alphabetHashUpper[x] #finds the current value of the letter within the uppercase hash
		#check for any non-letter character being passed, will return value of nil, dont know why it is passing the .is_upper test
		if value == nil
			return x
		end
		shiftedValue = value + y #finds the shifted value based on user inputted shift
		if shiftedValue > 25
			shiftedValue = shiftedValue - 26
		end
		shiftedLetter = alphabetUpper[shiftedValue] #finds the new shifted letter
		return shiftedLetter #returns the shifted letter
	else
		value = alphabetHashLower[x]
		shiftedValue = value + y
		if shiftedValue > 25
			shiftedValue = shiftedValue - 26
		end
		shiftedLetter = alphabetLower[shiftedValue]
		return shiftedLetter
	end
end
end

string = gets.chomp #user string input
shift = gets.chomp.to_i #user shift amount input
stringArray = string.split("") #turn string into an array of letters

stringShifted = []
stringArray.each { |x| stringShifted << ceasar_cipher(x,shift) } #run method on each letter and pass into an array for the shifted string 
puts stringShifted.join
