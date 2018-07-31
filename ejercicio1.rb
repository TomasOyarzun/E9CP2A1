class Table
	attr_reader :name, :days
	def initialize(name, *days)
		@name = name
		@days = days
		@average
		@total_numbers
	end

	def max
		return self.days.max
	end

	def total_collection(days)
		@average = days.inject(0){ |sum, i| sum += i.to_i }
		@total_numbers = self.days.length
		return [@average, @total_numbers]
	end
end

file = File.open('recaudaciones.txt', 'r')
data = file.readlines
file.close

recaudaciones = []
data.each do |info|
	ls = info.split(', ')
	recaudaciones << Table.new(*ls)
end

sum_days = []
recaudaciones.each do |info|
	puts "En #{info.name} el valor máximo es: #{info.max}" 
	sum_days << info.days
end

average = 0
total_numbers = 0
recaudaciones.each do |info|
	average += info.total_collection(info.days).first
	total_numbers += info.total_collection(info.days).last
end

puts average / total_numbers.to_f




