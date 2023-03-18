class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def index
        tenants = Tenant.all
        render json: tenants
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant
    end

    def update
        tenant = Tenant.find_by(id: params[:id])
        tenant.update(tenant_params)
        render json: tenant
    end

    def destroy
        tenant = Tenant.find_by(id: params[:id])
        tenant.destroy
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    def render_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: unprocessable_entity
    end


end
