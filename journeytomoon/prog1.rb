n, p = gets.split.map{ |el| el.to_i }

class Astronaut
  attr_accessor :id, :country_id, :vertices

  def initialize(id)
    @id = id
    @vertices = []
  end

end

class Country
  attr_accessor :id, :astronauts, :num_astronauts

  def initialize(id)
    @id = id
    @astronauts = {}
    @num_astronauts = 0
  end
end

class UN
  attr_accessor :countries, :astronauts, :lone_astronauts

  def initialize(num_astronauts)
    @countries = {}
    @astronauts = {}
    @lone_astronauts = {}

    num_astronauts.times do |a_id|
      a = Astronaut.new(a_id)
      @astronauts[a.id] = a
      @lone_astronauts[a.id] = a
    end

  end

  def assign_countries
    @lone_astronauts.each do |id, a|
      country = Country.new(id)
      country.astronauts[id] = a
      country.num_astronauts += 1
      countries[country.id] = country
    end

    @astronauts.each do |id, a|
      next if a.country_id
      assign_country(a, a.id)
    end

  end

  def assign_country(astronaut, country_id)

    @countries[country_id] ||= Country.new(country_id)
    astronaut.country_id = country_id
    unless @countries[country_id].astronauts[astronaut.id]
      @countries[country_id].astronauts[astronaut.id] = astronaut
      @countries[country_id].num_astronauts += 1
    end

    astronaut.vertices.each do |a2|
      next if !!a2.country_id
      a2.country_id = country_id
      assign_country(a2, country_id)
    end
  end

end

un = UN.new(n)

p.times do |line|
  a1_id, a2_id = gets.split.map{ |astronaut_id| astronaut_id.to_i }

  a1 = un.astronauts[a1_id]
  a2 = un.astronauts[a2_id]

  a1.vertices << a2
  a2.vertices << a1

  un.lone_astronauts.delete(a1.id)
  un.lone_astronauts.delete(a2.id)
end

un.assign_countries

count = 0
country_sizes = un.countries.map { |id, country| country.num_astronauts }
(country_sizes.count - 1).times do
  country_size = country_sizes.shift
  pairable_astronauts = country_sizes.inject(:+)
  count += country_size * pairable_astronauts
end
p count
