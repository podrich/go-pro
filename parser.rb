lines=0
words=0
characters=0
constitution='constitution.txt'
File.open(constitution).each do |line|
	lines+=1
    line.each_char do |character|
    	if character==" "||character==':'||character=='.'||character==";"||character==","
    		words+=1
    	end
    	characters+=1
    end
end

puts lines
puts words
puts characters
