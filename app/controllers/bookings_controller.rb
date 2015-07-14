class BookingsController < ApplicationController
  before_action :load_teacher

  def new
    @booking = @teacher.bookings.new
  end

  def create
    @booking = @teacher.bookings.build(booking_params)
    @user = current_user
    @booking.student_id = @user.id
    @booking.teacher = @teacher

    respond_to do |format|
      if @booking.save
        format.html { redirect_to teacher_path(@teacher), notice: 'booking was successfully created.' }
        format.js {}
      else
        format.html {render :new}
        format.js {}
      end
    end
  end

  def index
    @bookings = @teacher.bookings
  end

  def destroy
  end

private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def load_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

end
