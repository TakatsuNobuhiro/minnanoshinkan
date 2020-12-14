class Students::GetCategoryChildrenController < ApplicationController
  def index
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    respond_to do |format|
      format.html 
      format.json { 
        render json: @category_children
      }
    end  
  end
end