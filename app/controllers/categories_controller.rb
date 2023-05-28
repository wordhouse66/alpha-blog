class CategoriesController < ApplicationController
    protect_from_forgery with: :null_session#, only: :destroy
    skip_before_action :verify_authenticity_token

    def index
    end

    def new
        @category = Category.new(category_params)
    end

    def show
    end

    def create
        @category = Category.new(category_params)

        respond_to do |format|
            if @category.save
                format.html { redirect_to articles_url, notice: "Category was successfully created." }
                format.json { render :json => @category }
            end
        end
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end