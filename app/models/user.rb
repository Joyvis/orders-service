class User < ApplicationRecord
  validates :identification_document, presence: true,
                                      uniqueness: { case_sensitive: false }
end
