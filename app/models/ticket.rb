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
end
