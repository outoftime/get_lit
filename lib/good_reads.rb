module GoodReads

  extend self

  API_KEY = ENV['GOODREADS_API_KEY']

  def get_book(id)
    response = get("/book/show", :format => 'xml', :id => id)
    book = response.at_xpath('/GoodreadsResponse/book')
    Hashie::Mash.new(
      :id => book.at_xpath('./id').text.to_i,
      :authors => book.xpath('./authors/author/name').map { |node| node.text },
      :title => book.at_xpath('./title').text,
      :image_url => book.at_xpath('./image_url').text,
      :link => book.at_xpath('./link').text,
      :popular_shelves => book.xpath('./popular_shelves/shelf').map { |node| node.attr('name') }
    )
  end

  def search_books(field, query)
    response = get(
      '/search.xml',
      :q => query,
      'search[field]' => field
    )
    response.css('search > results > work').map do |work|
      best_book = work.css('best_book').first
      Hashie::Mash.new(
        :id => best_book.search('./id').text.to_i,
        :title => best_book.search('./title').text,
        :author => best_book.search('./author/name').text,
        :image_url => best_book.search('./image_url').text
      )
    end
  end


  private

  def get(path, query = {})
    uri = URI::HTTP.build(
      :host => 'www.goodreads.com',
      :path => path,
      :query => query.merge(:key => API_KEY).to_query
    )
    response = Net::HTTP.get(uri)
    puts response
    Nokogiri::XML(response)
  end

end
