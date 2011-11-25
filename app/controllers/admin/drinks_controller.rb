module Admin
  class DrinksController < AdminController
    before_filter :load_drink, :only => %w(edit update)

    def index
      @drinks = Drink.order('name ASC').page(params[:page] || 1).per(20)
    end

    def edit
    end

    def update
      @drink.update_attributes!(params[:drink])
      redirect_to admin_drinks_path
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end

    private

    def load_drink
      @drink = Drink.find(params[:id])
    end
  end
end
