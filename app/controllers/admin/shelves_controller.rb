module Admin
  class ShelvesController < AdminController
    before_filter :load_shelf, :only => %w(edit update destroy)
    before_filter :sanitize_params, :only => %w(create)

    def index
      @shelves = Shelf.includes(:drink).order('name ASC').page(params[:page] || 1).per(20)
    end

    def new
      @shelf = Shelf.new
    end

    def create
      @shelf = Shelf.new(params[:shelf])
      @shelf.save!
      redirect_to admin_shelves_url
    rescue ActiveRecord::RecordInvalid
      render :action => :new
    end

    def edit
    end

    def update
      @shelf.update_attributes!(params[:shelf])
      redirect_to admin_shelves_url
    rescue ActiveRecord::RecordInvalid
      render :action => :edit
    end

    def destroy
      @shelf.destroy
      redirect_to admin_shelves_url
    end

    private

    def load_shelf
      @shelf = Shelf.find(params[:id])
    end

    def sanitize_params
      if params[:shelf][:drink_id].present?
        params[:shelf].delete(:drink_attributes)
      end
    end
  end
end
