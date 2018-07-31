class Roulette
	#Constructor
	def initialize
		@chance = (1..10).to_a
	end

	#Methods
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
		#Reading and processing file info.
		data = []
		numbers = []
		file = File.open(a, 'r'){ |file| data = file.readlines }
		data.each do |info|
			numbers << info.split("\n")
		end
		#Getting the number with more ocurrences
		return numbers.group_by{ |i| i}.max{|x,y| x[1].length <=> y[1].length }[0]
	end
end

a = Roulette.new
puts a.reader



