require 'matrix'
t = gets.to_i
t.times do
  @counter = nil
  q = gets.to_i
  folks = Matrix[gets.split(" ").map(&:to_i).sort]
  targets = folks.first.downto(folks.first-4)
  targets.each do |target|
    least = Matrix[Array.new(q, target)]
    diff = folks - least
    min = diff.map { |folk| folk/5 + (folk%5)/2 + (folk%5)%2 }.inject(&:+)
    @counter ||= min
    @counter = @counter < min ? @counter : min
  end
  puts @counter
end
