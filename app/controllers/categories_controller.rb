class CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @items = @category.set_categories.order("created_at DESC").page(params[:page]).per(12)
  end

  private
  def set_category
    @category = Category.find(params[:id])
    if @category.has_children?
      @category_links = @category.children
    else
      @category_links = @category.siblings
    end
  end
end
