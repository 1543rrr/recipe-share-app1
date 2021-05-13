class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @dishes = @dishes.paginate(page: params[:page], per_page: 5)
      # @log = Log.new
      # render action: :edit
    end
  end

  def about
  end

  def terms
  end
end