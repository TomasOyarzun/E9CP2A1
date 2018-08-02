#Class
class Table
	attr_reader :name, :days
	#Constructor
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

#Saving file in to an array.
file = File.open('recaudaciones.txt', 'r')
data = file.readlines
file.close

#Instantiating objects.
recaudaciones = []
data.each do |info|
	ls = info.split(', ')
	recaudaciones << Table.new(*ls)
end

#Output 1
recaudaciones.each do |info|
	puts "En #{info.name} el valor máximo es: #{info.max}" 
end

#Output 2
average = 0
total_numbers = 0
recaudaciones.each do |info|
	average += info.total_collection(info.days).first
	total_numbers += info.total_collection(info.days).last
end

puts "El promedio total recaudado de todas las mesas en todos los días es: #{average / total_numbers.to_f}"