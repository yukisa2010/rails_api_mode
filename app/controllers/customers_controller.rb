class CustomersController < ApplicationController
    def index
        @customers = Customer.left_joins_organization
        render json: @customers
    end

    def search
        @customers = Customer.left_joins_organization
        @customers = @customers.where('customers.name LIKE ?', "%#{params[:name]}%") if params[:name].present?
        @customers = @customers.where('gender = ?', params[:gender]) if params[:gender].present?
        @customers = @customers.where('organization_id = ?', params[:organizationId]) if params[:organizationId].present?
        render json: @customers
    end

    # private

    # def customers_params
    #     params.fetch(:customers, {}).permit(:name, :gender, :birthday, :organization_id)
    # end
end
