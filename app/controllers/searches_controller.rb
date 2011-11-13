class SearchesController < ApplicationController
  def new
  end

  def show
    title = params[:title]
    if title
      @book = Rails.cache.fetch("book/#{title.downcase.gsub(/\W+/, '-')}") do
        results = GoodReads.search_books(:title, title)
        if results.any?
          book = GoodReads.get_book(results.first.id)
        end
      end

      if @book
        if @book.popular_shelves.present?
          shelves_by_name = {}
          Shelf.where(:name => @book.popular_shelves).where('drink_id IS NOT NULL').each do |shelf|
            shelves_by_name[shelf.name] = shelf
          end
          if shelves_by_name.any?
            @shelf = nil
            @book.popular_shelves.each do |name|
              break if @shelf = shelves_by_name[name]
            end
            @drink = @shelf.drink
          end
        end
      end
    end
  end
end
