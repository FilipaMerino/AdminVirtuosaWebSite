class PagesController < ApplicationController
  def home
    @testimonial = Testimonial.all
  end
end
