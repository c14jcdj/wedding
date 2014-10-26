class GuestsController < ApplicationController

def index
end

def new
end

def create

	@guest = Guest.new(guest_params)
 
  @guest.save
  redirect_to @guest
 end

 def show
 	@guest = Guest.find(params[:id])
 	@guests = []
 	Guest.find_each do |guest|
 		@guests.push(guest)
 	end
 end

 def edit
 	@guest = Guest.find(params[:id])
 end

 def update
 	@guest = Guest.find(params[:id])
 
  if @guest.update(guest_params)
    redirect_to @guest
  else
    render 'edit'
  end
 end


def code_check
	@code = params[:code].downcase
	    # # format.js   {}
      if @code == 'fisher620'
        render :json => true
      else
        render :json => false
      end
end

 private
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :rsvp, :food)
  end
end
