class EntriesController < ApplicationController
  def index
    @entries = Category.find_by(kind: params[:category_name]).entries
  end
end
