class Ticket < ApplicationRecord
  validates :name, :presence => true,
            :length => {:minimum => 6}
  validates :email_address, format: {with: URI::MailTo::EMAIL_REGEXP},
            :presence => true
  validates :price,
            :presence => true
  validates :seat_id_seq,
            :presence => true
  validates :address,
            :presence => true
  validate :price_in_range

  belongs_to :event
  belongs_to :user

  def price_in_range
    print("price validator")
    event = Event.find(event_id)
    if price && (price < event.price_low || price > event.price_high)
      errors.add('Cena', 'nie moze byc nizsza od minimalnej lub wieksza od maksymalnej')
    end
  end
end
