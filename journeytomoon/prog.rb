#!/bin/ruby
n, p = gets.split.map(&:to_i)

@nodes = {}
@graph_sizes  = []

def graph_size(size, node, nodes)
  node[:edges].each do |edge_id|
    next if !!nodes[edge_id][:graph_id]
    nodes[edge_id][:graph_id] = node[:graph_id]
    size = graph_size(size+1, nodes[edge_id], nodes)
  end
  size
end
  
p.times do
   a,b = gets.split.map(&:to_i)
   
   @nodes[a] ||= { id: a, edges: [] }
   @nodes[a][:edges] << b

   @nodes[b] ||= { id: b, edges: [] }
   @nodes[b][:edges] << a
end

@nodes.each do |id, node|
  next if !!node[:graph_id]
  node[:graph_id] = id
  @graph_sizes << graph_size(1, node, @nodes)
end

single_nodes = (n - @nodes.length)
@count = 0
@graph_sizes.length.times do |i|
  graph_size = @graph_sizes.shift
  remaining_nodes = @graph_sizes.inject(:+).to_i + single_nodes
  @count += graph_size * remaining_nodes
end

@count += (single_nodes - 1).downto(1).inject(:+) if single_nodes > 1

puts @count
