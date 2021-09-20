class CustomersController < ApplicationController
    before_action :authenticate_user!

    def index
        customers = Customer.left_joins_organization.order(:id)
        render json: customers, status: :ok
    end

    def search
        customers = Customer
                        .left_joins_organization.order(:id)
        customers = customers.search(customer_params)
        render json: customers, status: :ok
    end

    def create
        Customer.create!(customer_params)
    end

    private

        def customer_params
            params.permit(:name, :gender, :birthday, :organization_id)
        end

end
