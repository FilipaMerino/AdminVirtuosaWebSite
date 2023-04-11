class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:update, :edit, :destroy]

  def index
    @testimonials = Testimonial.all
  end

  def new
    @testimonial = Testimonial.new
  end


  def create
    @testimonial = Testimonial.create(testimonial_params)
    if @testimonial.save
      redirect_to testimonials_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    # The @testimonial variable is already set in the before_action callback
  end


  def update
    if @testimonial.update(testimonial_params)
      redirect_to root_path(anchor: 'testimonials')
    else
      render :edit
    end
  end


  def destroy
    @testimonial.destroy
    redirect_to posts_path
  end



  private


  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end


  def testimonial_params
    params.require(:testimonial).permit(:message, :name, :photo, :company)
  end

end
