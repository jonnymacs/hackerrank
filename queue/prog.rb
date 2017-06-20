#!/bin/ruby
q = gets.to_i

class Stack
  def initialize
    @items = []
  end

  def push(el)
    @items << el
  end

  def pop
    @items.pop
  end

  def tail
    @items.last
  end

  def length
    @items.length
  end

  def empty?
    length == 0
  end
end

class Queue
  def initialize
    @s1, @s2 = Stack.new, Stack.new
  end

  def enqueue(el)
    @s1.push el
  end

  def dequeue
    shift
    @s2.pop
  end

  def head
    shift
    @s2.tail
  end

  private

  def shift
    (@s1.length).times { @s2.push @s1.pop } if @s2.empty?
  end

end

queue = Queue.new
q.times do
  type, value = gets.split(" ").map(&:to_i)
  case type
  when 1
    queue.enqueue value
  when 2
    queue.dequeue
  when 3
    puts queue.head
  end
end
