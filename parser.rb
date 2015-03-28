lines=0
words=0
characters=0
constitution='constitution.txt'
File.open(constitution).each do |line|
	lines+=1
	words+=line.scan(/\S+/).size
    line.each_char do |character|
    	characters+=1
    end
end
lines=lines.to_s
words=words.to_s
characters=characters.to_s
puts "#{lines}   #{words}   #{characters} #{constitution}"