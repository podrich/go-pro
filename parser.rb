lines=0
words=0
characters=0
nonProperLines=0
nonProperWords=0
nonProperCharacters=0
constitution='constitution.txt'
File.open(constitution).each do |line|
	lines+=1
	words+=line.scan(/\S+/).size
    line.each_char do |character|
    	characters+=1
    end
    line=line.upcase
	candidates=line.scan(/\S+/)
	isLineProper=false	
	candidates.each do |choice|
		choice.gsub(/[^A-Za-z0-9\s]/i, '')
		if choice=="I"||choice=="WE"||choice=="THEY"||choice=="A"||choice=="AND"||choice=="THE"||choice=="THAT"||choice=="OF"||choice=="FOR"||choice=="WITH"
			puts choice
			nonProperWords+=1
			if isLineProper==false
				nonProperLines+=1
				isLineProper=true
			end
			nonProperCharacters+=choice.length
		end
	end	
end
properLines=lines - nonProperLines
properWords=words - nonProperWords
properCharacters=characters - nonProperCharacters
lines=lines.to_s
words=words.to_s
characters=characters.to_s
puts "all: #{lines}   #{words}   #{characters} #{constitution}"
puts properLines
puts properWords
puts properCharacters