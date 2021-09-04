class Customer < ApplicationRecord
    belongs_to :organization
    enum gender: { male: 0, female: 1 }

    def self.left_joins_organization
        self
            .left_outer_joins(:organization)
            .select('customers.*, organizations.name AS organization_name')
    end

end
