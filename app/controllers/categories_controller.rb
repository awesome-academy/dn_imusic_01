class CategoriesController < ApplicationController

  def index
    @categories = Category.sort_by_name.paginate page: params[:page]
  end

  def show; end
end
