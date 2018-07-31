require 'date'
class Course
	attr_reader :name
	def initialize(name, *dates)
		@name = name
		@dates = dates.map{ |e| Date.parse(e) }
	end

	def after(filter_date)
		@dates.select{ |date| date < filter_date }
	end

	def before(filter_date)
		@dates.select{ |date| date > filter_date }
	end
end

courses = []
data = []
file = File.open('cursos.txt', 'r'){ |file| data = file.readlines }
data.each do |info|
	ls = info.split(', ')
	courses << Course.new(*ls)
end

courses.each{ |e| puts "Cursos previos: #{e.name} #{e.after(Date.today)}\nCursos posteriores: #{e.name} #{e.before(Date.today)}"  }