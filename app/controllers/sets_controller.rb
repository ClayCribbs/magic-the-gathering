class SetsController < ApplicationController
  def index
    @sets = MtgSet.all.order('mkm_id ASC')
  end

  def show
    @set = MtgSet.find(params[:id])
  end
end
