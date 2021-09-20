class Customer < ApplicationRecord
    belongs_to :organization
    enum gender: { male: 0, female: 1 }

    def self.left_joins_organization
        self
            .left_outer_joins(:organization)
            .select('customers.*, organizations.name AS organization_name')
    end

    def self.search(customer_params)
        customers = self
        customers = customers.where('customers.name LIKE ?', "%#{customer_params[:name]}%") if customer_params[:name].present?
        customers = customers.where('customers.gender = ?', customer_params[:gender]) if customer_params[:gender].present?
        customers = customers.where('customers.organization_id = ?', customer_params[:organization_id]) if customer_params[:organization_id].present?

        customers
    end
end
