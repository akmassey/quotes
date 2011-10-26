class Fortune
  attr_accessor :fortunes

  def parse( fortunes )
    @fortunes = fortunes.split("\n%\n")

    @fortunes.delete_if { |f| f == "" }

    @fortunes = @fortunes.map do |f|
      f = f.gsub(/\n/, "")
      f =~ /"(.*)"    -- (.*)/
      quote = $1
      author = $2
      
      { :quote => quote, :author => author }
    end
  end

  def quotes
    @fortunes.map do |f|
      Quote.new( { :text => quote, :author_attributes => {:name => author } } ).save!
    end
  end

  def count
    @fortunes.length
  end
end
