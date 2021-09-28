class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
    2.times { @doctor.patients.build }
  end

  def create
    @doctor = Doctor.create(doctor_params)
    redirect_to doctor_path(@doctor)
  end

  private

  def doctor_params
    params.require(:doctor).permit(:name, patients_attributes: [:name, :age])
  end
end
