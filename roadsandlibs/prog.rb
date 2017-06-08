#!/bin/ruby

q = gets.strip.to_i

def build_city_graph(hackerland, city_graph, city)
  city[:edges].each do |edge| 
    next if !!city_graph[:cities][:"city#{edge}"]
    city_graph[:cities][:"city#{edge}"] = true
    hackerland[:cities][edge-1][:city_graph_id] = city_graph[:id]
    edge_city = hackerland[:cities][edge-1]
    build_city_graph(hackerland, city_graph, edge_city)
  end
  return city_graph
end

q.times do |i|
  num_cities, num_roads, c_lib, c_road = gets.strip.split(' ').map(&:to_i)
  hackerland = { num_cities: num_cities, 
                 cities: [],
                 city_graphs: [],
                 num_roads: num_roads,
                 c_lib: c_lib, 
                 c_road: c_road, 
                 rebuild_cost: 0 }
      
  num_cities.times do |k|
    hackerland[:cities][k] = {}
    hackerland[:cities][k][:number] = k + 1
    hackerland[:cities][k][:edges] = []
  end
  
  num_roads.times do
    city_o, city_d = gets.strip.split(' ').map(&:to_i)
    hackerland[:cities][city_o - 1][:edges] ||= []
    hackerland[:cities][city_o - 1][:edges] << city_d
    hackerland[:cities][city_d - 1][:edges] ||= []
    hackerland[:cities][city_d - 1][:edges] << city_o
  end
    
  if hackerland[:c_lib] < hackerland[:c_road]
    hackerland[:rebuild_cost] = hackerland[:num_cities] * hackerland[:c_lib]
    puts hackerland[:rebuild_cost]
    next
  end
  
  hackerland[:cities].each do |city|
    next if !!city[:city_graph_id]
    city_graph = { id: city[:number], cities: { :"city#{city[:number]}" => true } }
    hackerland[:city_graphs] << build_city_graph(hackerland, city_graph, city)
  end
  
  hackerland[:city_graphs].each do |city_graph|
    graph_cost = hackerland[:c_lib] + hackerland[:c_road] * (city_graph[:cities].length - 1)
    hackerland[:rebuild_cost] += graph_cost
  end
  puts hackerland[:rebuild_cost]
end