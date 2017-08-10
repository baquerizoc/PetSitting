class PetsController < ApplicationController
  before_action :authenticate_user!

  def new
  	@pet = Pet.new
    @pet_kinds = PetKind.all
  end
  def create
  	@pet = Pet.new(pet_params)
    @pet.user = current_user
  	if @pet.save!
  		redirect_to @pet
  	else
  		render :new
  	end
  end

  def edit
    @pet = Pet.find(params[:id])
    @pet_kinds = PetKind.all
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update!(pet_params)
      redirect_to @pet
    else
      render :edit
    end
  end

  def index
    @pets = Pet.where(user_id: current_user)
    @owner = current_user
    @to_calendar = []
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy!
  end


  def show
    @pet = Pet.find(params[:id])
    @owner = @pet.user.name
    @kind = @pet.pet_kind.name
  end

  private

  def pet_params
  	params.require(:pet).permit(:name, :pet_kind_id, :breed, :date_of_birth, :size)
  end



end
