#!/bin/ruby

n = gets.strip.to_i
m = gets.strip.to_i

nodes = {}
n.times do |i| 
  gets.strip.split(" ").each_with_index.map do |value,k| 
    nodes[:"#{i}#{k}"] = { address: :"#{i}#{k}", value: value.to_i } 
  end
end

def graph_size(nodes,node,size)
  neighbor_nodes = []
  node_address_p = node[:address].to_s.chars.map(&:to_i)
  (-1..1).each { |i| (-1..1).each { |k| neighbor_nodes << nodes[[node_address_p[0] + i, node_address_p[1] + k].join.to_s.to_sym] } }
  neighbor_nodes.each do |neighbor_node|
    next if !neighbor_node || neighbor_node[:value] == 0 || !!neighbor_node[:graph_id]
    neighbor_node[:graph_id] = node[:graph_id]
    size = graph_size(nodes,neighbor_node,size+1)
  end
  return size
end

largest = 0
nodes.each do |address,node|
  next if node[:value] == 0 || !!node[:graph_id]
  node[:graph_id] = node[:address]
  gs = graph_size(nodes,node,1)
  largest = largest > gs ? largest : gs
end

puts largest