class Admin::DashboardController < ApplicationController
  include HttpAuthConcern

  def show
    @products = Product.count
    @categories = Category.count
  end
end
