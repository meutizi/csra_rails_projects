#Implement all parts of this assignment within (this) module2_assignment2.rb file

#Implement a class called LineAnalyzer.
class LineAnalyzer
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize (content, line_number)
    @content = content
    @line_number = line_number
    @highest_wf_count = 0
    @highest_wf_words = []
    calculate_word_frequency()
  end
  def calculate_word_frequency() 
    word_count = Hash.new(0)
    content.split.each do |word| 
      word_count[word.downcase] += 1  
    end
    key, value = word_count.sort_by { |k,v| v }.reverse.to_h.first
    @highest_wf_count = value
  
    @highest_wf_words = word_count.select { |k,v| v == value }.keys
  end
end

#  Implement a class called Solution. 
class Solution
  # Implement the following read-only attributes in the Solution class.
  #* analyzers - an array of LineAnalyzer objects for each line in the file
  #* highest_count_across_lines - a number with the maximum value for highest_wf_words attribute in the analyzers array.
  #* highest_count_words_across_lines - a filtered array of LineAnalyzer objects with the highest_wf_words attribute equal to the highest_count_across_lines determined previously.

  def initialize 
    @analyzers = []
  end
  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  

  # Implement the following methods in the Solution class.
  #* analyze_file() - processes 'test.txt' intro an array of LineAnalyzers and stores them in analyzers.
  def analyze_file

    if File.exists? 'test.txt'
      File.foreach('test.txt').with_index do |line, line_num|
        lineAnalyzer = LineAnalyzer.new(line.chomp, line_num)
        @analyzers << lineAnalyzer
      end
    end
  end
  #* calculate_line_with_highest_frequency() - determines the highest_count_across_lines and highest_count_words_across_lines attribute values
  def calculate_line_with_highest_frequency
    analyzer =  @analyzers.max { |x,y| x.highest_wf_count <=> y.highest_wf_count }
    @highest_count_across_lines = analyzer.highest_wf_count
    
    @highest_count_words_across_lines =  @analyzers.select { |x| x.highest_wf_count == @highest_count_across_lines }
    
  end

  #* print_highest_word_frequency_across_lines() - prints the values of LineAnalyzer objects in highest_count_words_across_lines in the specified format
  def print_highest_word_frequency_across_lines
    print "The following words have the highest word frequency per line:"
    @highest_count_words_across_lines.each do |item| 
      print "\n#{item.highest_wf_words}  (appears in line ##{item.line_number})"
    end
    
  end
  
  # Implement the analyze_file() method() to:
  #* Read the 'test.txt' file in lines 
  #* Create an array of LineAnalyzers for each line in the file

  # Implement the calculate_line_with_highest_frequency() method to:
  #* calculate the maximum value for highest_wf_count contained by the LineAnalyzer objects in analyzers array
  #  and stores this result in the highest_count_across_lines attribute.
  #* identifies the LineAnalyzer objects in the analyzers array that have highest_wf_count equal to highest_count_across_lines 
  #  attribute value determined previously and stores them in highest_count_words_across_lines.

  #Implement the print_highest_word_frequency_across_lines() method to
  #* print the values of objects in highest_count_words_across_lines in the specified format
end
