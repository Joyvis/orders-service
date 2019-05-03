# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'User Test' }
    identification_document { '9999999999' }
    email { 'teste@teste.com' }
  end
end
