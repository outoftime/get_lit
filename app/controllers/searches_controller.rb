class SearchesController < ApplicationController
  def new
  end

  def show
    content_type :json

    title = params[:title]
    if title
      book = CACHE.fetch("book/#{title.downcase.gsub(/\W+/, '-')}") do
        results = GoodReads.search_books(:title, title)
        if results.any?
          book = GoodReads.get_book(results.first.id)
        end
      end

      if book
        if book.popular_shelves.present?
          shelves_by_name = {}
          Shelf.where(:name => book.popular_shelves).where('drink_id IS NOT NULL').each do |shelf|
            shelves_by_name[shelf.name] = shelf
          end
          if shelves_by_name.any?
            best_shelf = nil
            book.popular_shelves.each do |name|
              best_shelf = shelves_by_name[name]
              break if best_shelf
            end
            @book = book
            @drink = best_shelf.drink
          end
        end
      end
    end
  end
end
