class GuestsController < ApplicationController

def index
end

def new
end

def create
  @guest = Guest.new(guest_params)
  if (guest_params['rsvp'] == 'false') 
    @guest.food = 'NA'
  end
  unless (@guest.valid?)
    @errors = @guest.errors.messages
    render 'new'
    return
  end
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
      if(@guest.food == 'NA')
        @errors = 'You need to Enter a Food Choice'
        render 'edit'
        return
      end
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

def admin 
  @guests = Guest.all
  # @guests = []
  # Guest.find_each do |guest|
  #   @guests.push(guest)
  # end
end

 private
  def guest_params
    params.require(:guest).permit(:first_name, :last_name, :rsvp, :food)
  end
end
