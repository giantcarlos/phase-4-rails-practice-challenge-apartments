class ApartmentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def create
        apartment = Apartment.create(apartment_params)
        render json: apartment
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        apartment.update(apartment_params)
        render json: apartment
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        apartment.destroy
        head :no_content
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def render_invalid(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: unprocessable_entity
    end

end
