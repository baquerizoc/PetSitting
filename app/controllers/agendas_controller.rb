class AgendasController < ApplicationController

  def index
    @apet = Pet.where(user_id: current_user)
    @agendas = Agenda.where(pet_id: @apet.ids)
  end

  def create
    agendas = params[:agendas]
    agendas.each do |agenda|
      agenda = Agenda.new(agenda_params(agenda))
      agenda.save!
    end

    redirect_to agendas_path
  end

  def confirmation
    @agenda = Agenda.find(params[:id])
  end


  def new
    pets_to_add = params[:to_calendar]
    pets_to_add = Pet.where(id: pets_to_add)
    @agendas = []
    pets_to_add.each do |pet|
      @agendas << Agenda.new(pet: pet)
    end
  end

  def agenda_params(params)
    params.permit(:start_day, :end_day, :total_payment, :care_needs, :pet_id)
  end

  def agenda_params_edit
    params.require(:agenda).permit(:start_day, :end_day, :total_payment, :care_needs, :pet_id)
  end

  def edit
    @agenda = Agenda.find(params[:id])
  end

  def update
    @agenda = Agenda.find(params[:id])
    if @agenda.update!(agenda_params_edit)
      redirect_to @agenda
    else
      render :edit
    end
  end

  def show
    @agenda = Agenda.find(params[:id])
  end

  def destroy
    @agenda = Agenda.find(params[:id])
    @agenda.destroy!
  end

end
