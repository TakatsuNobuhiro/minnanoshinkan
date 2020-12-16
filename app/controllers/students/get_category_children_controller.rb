class Students::GetCategoryChildrenController < ApplicationController
  def index
    @category_children = Category.find_by(id: params[:parent_id].to_s, ancestry: nil).children
    respond_to do |format|
      format.html
      format.json do
        render json: @category_children
      end
    end
  end
end
