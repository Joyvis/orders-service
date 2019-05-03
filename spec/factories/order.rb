# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    cellphone_model { 'MOTO G7' }
    cellphone_imei { 'asd998877' }
    annual_price { 199 }
    installments { 2 }
  end
end
