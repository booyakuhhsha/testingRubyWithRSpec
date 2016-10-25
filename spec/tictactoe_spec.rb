require "tictactoe"

describe Board do 

	describe ".winner" do
		context "top row winner" do
			
			Board.class_variable_set(:@@position,["x","x","x",2,3,4,5,6,7])
			
			context " top row contains x x x" do
				it "returns @@winner" do
					expect(Board.winner).to eql(true)
				end
			end
		end
	end

	describe ".checkConflict" do
		context "'x' marker already in top left corner" do
			context "trying to place another marker on top left corner" do
				it "returns 'true'" do
					expect(Board.checkConflict(0)).to eql(true)
				end
			end
		end
	end
	
end

describe Player do

	let(:player1) {Player.new("Dom","x")}

	context "when the player is created" do
		it { expect(player1.name).to eql("Dom")}
		it { expect(player1.marker).to eql("x")}
	end

end