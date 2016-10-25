require "enumerableMethods"

describe Enumerable do 
	array = [1,1,1,1,2]
	describe ".my_count" do
		context "array with five items" do
			context "count amount of times 1 shows up in [1,1,1,1,2]" do
				it "returns '4'" do
					expect(array.my_count { |x| x == 1}).to eql(4)
				end
			end
			context "count amount of times 0 shows up in [1,1,1,1,2]" do
				it "returns '0'" do
					expect(array.my_count { |x| x == 0}).to eql(0)
				end
			end
			context "count amount of times x less than 100 in [1,1,1,1,2]" do
				it "returns '5'" do
					expect(array.my_count { |x| x < 100}).to eql(5)
				end
			end
		end
	end

	describe ".my_all?" do
		context "array with five items" do
			context "true if all items greater than or equal to 1 in [1,1,1,1,2]" do
				it "returns true" do
					expect(array.my_all? { |x| x >= 1}).to eql(true)
				end
			end
			context "false if all items smaller than 1 in [1,1,1,1,2]" do
				it "returns true" do
					expect(array.my_all? { |x| x < 1}).to eql(false)
				end
			end
		end
	end

	describe ".my_select" do
		context "array with five items" do
			context "output only 2 in [1,1,1,1,2]" do
				it "returns array with '2'" do
					expect(array.my_select { |x| x == 2}).to eql([2])
				end
			end
			context "selects all '1's in [1,1,1,1,2]" do
				it "returns array with 1,1,1,1" do
					expect(array.my_select { |x| x == 1}).to eql([1,1,1,1])
				end
			end
			context "select all '3's in [1,1,1,1,2]" do
				it "returns array with nil" do
					expect(array.my_select { |x| x == 3}).to eql([])
				end
			end
		end
	end

	describe ".my_map" do
		context "array with five items" do
			context "add 1 to each element in [1,1,1,1,2]" do
				it "returns array with [2,2,2,2,3]" do
					expect(array.my_map { |x| x + 1}).to eql([2,2,2,2,3])
				end
			end
			context "subtract 2 to each element in [1,1,1,1,2]" do
				it "returns array with [-1,-1,-1,-1,0]" do
					expect(array.my_map { |x| x - 2}).to eql([-1,-1,-1,-1,0])
				end
			end
			context "dont perform any operation on [1,1,1,1,2]" do
				it "returns array with [1,1,1,1,2]" do
					expect(array.my_map { |x| x }).to eql([1,1,1,1,2])
				end
			end
		end
	end

end