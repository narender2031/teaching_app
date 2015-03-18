class Timeslot < ActiveRecord::Base
	belongs_to :instructor
	has_many :bookings

  validate :consistent


  def timerange
    TimeRange.new(start_time, end_time)
  end

	def is_available?(requested_booking)
    booking_range = requested_booking.timerange
    within_range = self.timerange.in_range?(booking_range)

    no_other_bookings = bookings.none? do |booking|
      booking.timerange.overlap?(booking_range)
    end

    within_range && no_other_bookings
  end  

  private

  def consistent
    unless start_time < end_time
      errors.add(:start_time, "Cannot be greater than the end time")
    end
  end  
end




