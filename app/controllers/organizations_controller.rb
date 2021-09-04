class OrganizationsController < ApplicationController
    def index
        @organizations = Organization.all
        render json: @organizations
    end

    def show
        @organization = Organization.find(params[:id])
        render json: @organization
    end

    def create
        Organization.create!(
            name: params[:name]
        )
    end

    def update
        Organization.update(params[:id].to_i, name: params[:name])
    end

end
