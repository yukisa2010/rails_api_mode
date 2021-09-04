class CustomersController < ApplicationController
    def index
        @customers = Customer.all
        render json: @customers
    end

    def search
        @customers = Customer.where(name: params[:customer][:name])
    end

    private

    def customers_params
        params.require(:customer).permit(:name, :gender, :birthday, :organization_id)
    end
end
