lines=0
words=0
characters=0
nonProperLines=0
nonProperWords=0
nonProperCharacters=0
constitution='constitution.txt'
articles=0
sections=0
previous=" "
sectionsInArticles=Array.new
sectionCounter=0
hasBegunScanning=false
endOfArticles=false
File.open(constitution).each do |line|
	lines+=1
	words+=line.scan(/\S+/).size
    line.each_char do |character|
    	characters+=1
    end
    candidates=line.scan(/\S+/)
    if candidates[0]=="Article"&&previous.size==0||line.include?("Amendment")&&previous.size==0&&endOfArticles==false
    	if hasBegunScanning==true&&endOfArticles==false
    		sectionsInArticles.push(sectionCounter)
    		sectionCounter=0
    		if line.include?("Amendment")&&previous.size==0
    			endOfArticles=true
    		end
    		articles+=1
    	else
    		hasBegunScanning=true
    	end
    end
    if candidates[0]=="Section"&&previous.size==0
    	sections+=1
    	sectionCounter+=1
    end
    line=line.upcase
	candidates=line.scan(/\S+/)
	isLineProper=false	
	candidates.each do |choice|
		choice.gsub(/[^A-Za-z0-9\s]/i, '')
		if choice=="I"||choice=="WE"||choice=="THEY"||choice=="A"||choice=="AND"||choice=="THE"||choice=="THAT"||choice=="OF"||choice=="FOR"||choice=="WITH"
			nonProperWords+=1
			if isLineProper==false
				nonProperLines+=1
				isLineProper=true
			end
			nonProperCharacters+=choice.length
		end
	end	
	previous=candidates
end
properLines=lines - nonProperLines
properWords=words - nonProperWords
properCharacters=characters - nonProperCharacters
lines=lines.to_s
words=words.to_s
characters=characters.to_s
puts "all: #{lines}   #{words}   #{characters} #{constitution}"
puts "proper: #{properLines}  #{properWords}  #{properCharacters}"
puts "Total Articles: #{articles}"
puts "Total Sections: #{sections}"
puts "Total Sections per Article:"
counter=0
sectionsInArticles.each do |result|
	puts "  Article #{counter+1}: #{result}"
	counter+=1
end
