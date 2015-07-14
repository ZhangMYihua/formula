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
    @booking.end_time = put_end_time(@booking.start_time)

    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @teacher, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @availability }
      else
        format.html {render :new}
        format.js {}
      end
    end
  end

  def index
    @booking = @teacher.bookings
  end

  def destroy
  end

private

  def put_end_time(start_time)
     (start_time.to_time + 1.hours).to_datetime
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def load_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

end
