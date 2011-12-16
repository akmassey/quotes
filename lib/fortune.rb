##
# Manages the import and export of Fortune files as Ruby objects.
class Fortune
  attr_accessor :fortunes, :quotes, :authors

  ##
  # TODO: This initialize method is way too complex.
  def initialize(fortune_file)
    @fortunes = []
    @quotes = []
    @authors = []
    
    self.parse(fortune_file)
    self.create_quotes_and_authors
  end

  ##
  # Allows indexing directly into the fortunes array.
  # 
  # @param [Integer] value The index desired.
  # @return [String] The fortune at that index.
  # @author masseya
  def [](value)
    @fortunes[value]
  end

  def each 
    for fortune in @fortunes
      yield fortune
    end
  end

  ##
  # Returns the author string for the indexed author.
  # 
  # @param [Integer] value The index desired.
  # @return [String] The author of the fortune at that index.  
  # @author masseya
  def author(index)
    @authors[index]
  end

  # ##
  # Returns the quote string for the indexed fortune
  # 
  # @param [Integer] value The index desired.
  # @return [String] The quote of the fortune at that index.  
  # @author masseya
  def quote(index)
    @quotes[index]
  end

  ##
  # Creates Quote and Author objects for each of the fortunes passed as parameters.
  # TODO: This should check for duplicates
  # 
  # @param [Array] fortunes The array of fortune Strings to process.
  # @author masseya
  def create_quotes_and_authors
    Rails.logger.info "[fortune] Creating quotes and authors"

    @fortunes.each_with_index do |f, i|
      unless Author.find_by_name( f[:author] ) 
        Rails.logger.info "[fortune] attempting to create author: " + f[:author]
        
        author = Author.new( { :name => f[:author] } )
        author.save!
        @authors.push author

        Rails.logger.info "[fortune] attempting to create this quote: " + f[:quote]
                
        quote = Quote.new( { :text => f[:quote] } )
        quote.author = author
        quote.save!
        @quotes.push quote
      end
    end
  end
  
  ##
  # Loads fortunes from a traditional fortune file.
  # TODO: This currently overwrites any existing fortunes, but it shouldn't.
  def load_from_fortune_file(file)
    fortunes = file.split("%")
    
    fortunes = fortunes.map do |f|      
      f =~ /\n"(.*)"\n    -- (.*)/
      quote = $1
      author = $2
      
      next if ( quote == nil or author == nil )
      
      { :quote => quote, :author => author }
    end
    
    # TODO: add the values to the hash
  end

  def count
    @fortunes.length
  end

  protected 

  def parse(fortunes)
    @fortunes = fortunes.split("\n%\n")

    @fortunes.delete_if { |f| f == "" }

    @fortunes = @fortunes.map do |f|
      f = f.gsub(/\n/, "")
      f =~ /"(.*)"    -- (.*)/
      quote = $1
      author = $2
      
      next if ( quote == nil or author == nil )
      
      { :quote => quote, :author => author }
    end
  end
end
