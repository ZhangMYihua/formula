class BookingsController < ApplicationController
  before_action :load_teacher

  def new
    @booking = @teacher.bookings.new
  end

  def create
    @booking = @teacher.bookings.build(booking_params)
    @booking.student_id = current_user.id
    @booking.teacher_id = @teacher.id
    @booking.end_time = put_end_time(@booking.start_time)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @teacher, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html {render :new}
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @bookings = @teacher.bookings.all
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
