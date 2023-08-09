class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new],expect: [:index]

  def index
  end  
end
