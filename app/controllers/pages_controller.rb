class PagesController < ApplicationController
  def home
    respond_to do |format|
      format.html
    end
  end
end