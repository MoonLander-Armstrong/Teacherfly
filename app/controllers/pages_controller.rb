# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @chapters = Chapter.all
  end
end
