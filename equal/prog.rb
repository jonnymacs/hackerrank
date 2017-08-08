require 'matrix'
t = gets.to_i
t.times do
  @counter = nil
  q = gets.to_i
  # build a matrix of all the people and the number they have
  folks = Matrix[gets.split(" ").map(&:to_i).sort]

  # our target is the person(s) with the least number
  # but we also have to check as many targets as we can give
  # at one time (5 in this case)
  targets = folks.first.downto(folks.first-4)

  # for each target
  targets.each do |target|
    # build a matrix of length (num people)
    # initialize to the target
    #
    least = Matrix[Array.new(q, target)]

    # matrix subtraction - this gives us the number
    # each person needs to get to be done
    #
    diff = folks - least

    # count the min number of gives for each person
    # and sum those
    # we give 5 as many times as we can, then we give 2, then 1
    min = diff.map { |need| need/5 + (need%5)/2 + (need%5)%2 }.inject(&:+)

    # each target has a min. the target with the lowest min is the answer
    @counter ||= min
    @counter = @counter < min ? @counter : min
  end
  puts @counter
end
