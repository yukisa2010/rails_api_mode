class CustomersController < ApplicationController
    def index
        @customers = Customer.left_joins_organization.order(:id)
        render json: @customers, status: :ok
    end

    def search
        @customers = Customer.left_joins_organization.order(:id)
        @customers = @customers.where('customers.name LIKE ?', "%#{customer_params[:name]}%") if customer_params[:name].present?
        @customers = @customers.where('customers.gender = ?', customer_params[:gender]) if customer_params[:gender].present?
        @customers = @customers.where('customers.organization_id = ?', customer_params[:organization_id]) if customer_params[:organization_id].present?
        render json: @customers, status: :ok
    end

    def create
        Customer.create!(customer_params)
    end

    private

        def customer_params
            params.permit(:name, :gender, :birthday, :organization_id)
        end

end
