class Event < ApplicationRecord
  validates :artist, :presence => true,
            :length => {:minimum => 6}
  validates :price_low, numericality: true,
            :presence => true
  validates :price_high, numericality: true,
            :presence => true
  validates :event_date,
            :presence => true

  validate :event_date_not_from_past
  validate :price_low_less_than_price_high

  has_many :tickets

  def event_date_not_from_past
    if event_date && (event_date < Date.today)
      errors.add('Data wydarzenia', 'nie moze byc z przeszlosci')
    end
  end

  def price_low_less_than_price_high
    if price_low && (price_high && price_low > price_high)
      errors.add('Minimalna cena', 'nie moze byc nizsza od maksymalnej')
    end
  end
end
