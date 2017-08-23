class SittersController < ApplicationController
  

	def index
    	@agendas = Agenda.where(user: nil)
  	end

  def show
    @agenda = Agenda.find(params[:id])
  end

  def confirmation
  	@agenda = Agenda.find(params[:id])
    authorize! :confirmation, @agenda unless (@agenda.user.blank? || @agenda.user == current_user)
    @agenda.user_id = current_user.id
    @agenda.save!
  end

  def destroy
    @agenda = Agenda.find(params[:id])
    @agenda.user = nil
    @agenda.save!
    redirect_to scheduled_sittings_path
  end

  def scheduled_sittings
  	@agendas = Agenda.where(user: current_user)
  end
  

end
