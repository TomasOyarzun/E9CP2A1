class Roulette
	#Constructor
	def initialize
		@chance = (1..10).to_a
	end

	def play(num)
		@scan = @chance[rand(0..9)]
		manage(@scan)
		winners(@scan) if @scan == num		
	end

	def manage(num)
		File.open('roulette_history.txt', 'a'){ |file| file.puts "#{num}"}
	end

	def winners(num)
		File.open('winners.txt', 'a'){ |file| file.puts "#{num}"}	
	end

	def reader(a = 'roulette_history.txt')
		data = []
		numbers = []
		file = File.open(a, 'r'){ |file| data = file.readlines }
		data.each do |info|
			numbers << info.split("\n")
		end
				
	end
end

a = Roulette.new
a.reader



