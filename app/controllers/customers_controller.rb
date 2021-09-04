class CustomersController < ApplicationController
    def index
        @customers = Customer.left_joins_organization
        render json: @customers
    end

    def search
        @customers = Customer.left_joins_organization
        @customers = @customers.where('customers.name LIKE ?', "%#{customer_params[:name]}%") if params[:name].present?
        @customers = @customers.where('gender = ?', customer_params[:gender]) if customer_params[:gender].present?
        @customers = @customers.where('organization_id = ?', customer_params[:organizationId]) if params[:organizationId].present?
        render json: @customers
    end

    def create
        Customer.create!(customer_params)
    end

    private

    def customer_params
        params.permit(:name, :gender, :birthday, :organization_id)
    end

end
