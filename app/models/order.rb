class Order < ApplicationRecord
  validates :annual_price, :celphone_model, :celphone_imei, presence: true
end
