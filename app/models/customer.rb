class Customer < ApplicationRecord
    belongs_to :organization
    enum gender: { male: 0, female: 1 }
end
