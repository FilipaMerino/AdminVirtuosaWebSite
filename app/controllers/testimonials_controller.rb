class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:destroy, :edit, :update]

  def index
    @testimonial = Testimonial.all
  end



  def new
    @testimonial = Testimonial.new
  end



  def create
    @testimonial = Testimonial.create
    if @testimonial.save
      redirect_to testimonial_path(@testimonial)
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    # The @testimonial variable is already set in the before_action callback
  end


  def update
    if @testimonial.update(testimonial_params)
      redirect_to testimonial_path(@testimonial)
    else
      render :edit
    end
  end



  def destroy
    @testimonial.destroy
    redirect_to @testimonials_path
  end



  private

  def set_testimonial
    @testimonial.find(params[:id])
  end


  def testimonial_params
    params.require(:testimonia).permit(:message, :name, :photo, :company)
  end

end
