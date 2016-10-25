module Enumerable
	def my_each
		n = self.size
		for i in 0..(n-1)
			yield(self[i])
		end
	end

	def my_each_with_index
		self.my_each { |x| yield(x,x)}
	end

	def my_select
		select = []
		self.my_each do |x|
			if yield(x) == true
				select << x
			end
		end
		return select
	end
	def my_all?
		n = self.size
				for i in 0..(n-1)
					if yield(self[i]) == true
						a = true
					else
						a = false
						break
					end
				end
				return a
	end			

	def my_any?
		n = self.size
		for i in 0..(n-1)
			if yield(self[i]) == true
				a = true
				break
			else
				a = false
			end
		end
		return a
	end

	def my_none?
		n = self.size
		for i in 0..(n-1)
			if yield(self[i]) == true
				a = false
				break
			else
				a = true
			end
		end
		return a
	end

	def my_count(arg1 = true)
		count = 0
		n = self.size 
		if block_given? == true
			for i in 0..(n-1)
				if yield(self[i]) == true
					count += 1
				end
			end
		elsif arg1 == true
			for i in 0..(n-1)
				count += 1
			end
		else 
			for i in 0..(n-1)
				if self[i] == arg1
					count += 1
				end
			end
		end
		return count
	end

	def my_map(someProc = 0)
		mapped =[]
		n = self.size
		if block_given? == true
			for i in 0..(n-1)
				mapped << yield(self[i])
			end	
		else
			for i in 0..(n-1)
				mapped << someProc.call(self[i])
			end
		end
		return mapped
	end

	def my_inject(initialValue = 0, symbol)
		a = 1
		b = 2
		operator = symbol.to_s
		puts operator
	end
end

array = [0,1,2,3,4]
puts "Using the #each method here:"
each = array.each { |x| print x }
puts "Using the #my_each method here:"
myEach = array.my_each { |x| print x}

puts "Using the #each_with_index method here:"
array.each_with_index { |item,index| puts "This is the item: #{item} and it's position: #{index}" }
puts "Using the #my_each_with_index method here:"
array.my_each_with_index { |item,index| puts "This is the item: #{item} and it's position: #{index}" }

array = [0,1,2,3,4]
puts "Using the #select method here:"
selected = array.select { |x| x == 2 }
print selected
puts
puts "Using the #my_select method here:"
print array.my_select { |x| x == 2 }
puts
puts array.all? { |x| x >= 0}
puts array.my_all? { |x| x >= 0}

puts array.my_any? { |x| x == -1}

puts array.my_none? { |x| x == 1 }

puts array.none? { |x| x == 1}

puts array.count { |x| x == 1}
puts array.my_count { |x| x == 1}

print array.map { |x| x - 2}
puts
myMapProc = Proc.new do |x|
	x - 2
end
print array.my_map { |x| x - 2}
puts
print array.inject(1,:+)
puts
print array.my_inject(1,:+)
puts

