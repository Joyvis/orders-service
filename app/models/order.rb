# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  validates :annual_price, :cellphone_model, :cellphone_imei, presence: true
end
