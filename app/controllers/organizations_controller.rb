class OrganizationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @organizations = Organization.all.order(:id)
        render json: @organizations
    end

    def show
        @organization = Organization.find(params[:id])
        render json: @organization
    end

    def create
        Organization.create!(organization_params)
    end

    def update
        organization = Organization.find_by(id: params[:id])
        organization.update!(organization_params)
    end

    private

        def organization_params
            params.permit(:name)
        end

end
