t = gets.strip.to_i


# this works, but it's o(N*N) very slow...
#
# @pairs = { "[" => "]", "{" => "}", "(" => ")" }
# def remove_adjacents(expression)
#   expression.each_with_index do |char,i|
#     next_char = expression[i+1]
#     if next_char && next_char == @pairs[char]
#       expression.delete_at(i)
#       expression.delete_at(i)
#       expression = remove_adjacents(expression)
#     end
#   end
#   return expression
# end
#
# t.times do
#   expression = gets.strip.chars
#   balanced = true
#   l = expression.length
#   balanced = false if l%2 == 1 || remove_adjacents(expression).any?
#   puts balanced ? "YES" : "NO"
# end

# O(N) way better
def is_balanced?(expression)
  stack = []
  expression.each do |char|
    if char == '{'
      stack << '}'
    elsif char == '['
      stack << ']'
    elsif char == '('
      stack << ')'
    else
      return false if stack.empty? || char != stack.pop
    end
  end
  return stack.empty?
end

t.times { puts is_balanced?(gets.strip.chars) ? "YES" : "NO" }
