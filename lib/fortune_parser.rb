class FortuneParser
  attr_accessor :fortunes

  def parse( fortunes )
    @fortunes = fortunes.split("\n%\n")

    @fortunes.delete_if { |f| f == "" }

    # @fortunes.each do |f|
    #   next if f == "" 
    #   quote = f.match(/".*"/)
    #   author = f.match(/    -- .*/)
      
    #   Quote.new( { :text => quote, :author_attributes => {:name => author } } ).save!
    # end
  end

  def count
    @fortunes.length
  end
end
