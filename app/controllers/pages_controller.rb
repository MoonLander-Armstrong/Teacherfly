class PagesController < ApplicationController
  def home
    @chapters = Chapter.all
  end
end