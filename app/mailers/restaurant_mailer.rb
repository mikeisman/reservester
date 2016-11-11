class RestaurantMailer < ApplicationMailer
  def reservation_created(reservation)
    @reservation = reservation
    mail(
          to: @reservation.restaurant.user.email,
          from: 'Reservester <reservester@startupinstitute.com>',
          subject: "New reservation at #{@reservation.restaurant.name}"
        )
  end
end
