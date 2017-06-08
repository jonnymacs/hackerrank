#!/bin/ruby
n, p = gets.split.map(&:to_i)

@astronauts = {}
@countries = {}

def build_graph(country, astronaut, astronauts)
  astronaut[:countrymen].each do |ac|
    next if !!astronauts[ac][:country_id]
    astronauts[ac][:country_id] = country[:id]
    country[:astronauts] += 1
    build_graph(country, astronauts[ac], astronauts)
  end
  country
end
  
p.times do
   a,b = gets.split.map(&:to_i)
   
   astro_a = begin
     @astronauts[a] ||= { id: a, countrymen: [], country_id: nil }
   end
   astro_b = begin
     @astronauts[b] ||= { id: b, countrymen: [], country_id: nil }
   end
  
   astro_a[:countrymen] << b
   astro_b[:countrymen] << a
end

@astronauts.each do |id, astronaut|
  next if astronaut[:country_id]
  astronaut[:country_id] = id
  country = { id: id, astronauts: 1 }
  @countries[id] = build_graph(country, astronaut, @astronauts)
end

countries = @countries.values
(n - @astronauts.length).times { countries << { astronauts: 1 } }

@count = 0
countries.length.times do |i|
  country = countries.shift
  n = country[:astronauts]
  k = countries.map{|c| c[:astronauts]}.inject(:+).to_i
  @count += n*k
end

puts @count
