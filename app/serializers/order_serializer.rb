# frozen_string_literal: true

class OrderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :cellphone_model, :cellphone_imei, :annual_price, :installments
end
