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

  if(guest_params['rsvp'] == 'true' && @guest.food == 'NA')
    @errors[:food] = 'x'
    end

    p '-----'
    p guest_params['rsvp'] == nil
  unless (@guest.valid? )
    if ( guest_params['rsvp'] == nil)
      @errors = [[:rsvp], ['y']]
    else
    @errors = @guest.errors.messages
    end
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
      if(@guest.food == 'NA' && guest_params['rsvp'] == 'true')
        @errors = [[:food, ['x']]]
        render 'edit'
        return
      end
      if(guest_params['rsvp'] == 'false')
        @guest.food == 'NA'
      end
    redirect_to @guest
  else
    @errors = @guest.errors.messages 
    if(guest_params['rsvp'] == 'true' && @guest.food == 'NA')
    @errors[:food] = 'x'
    end
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
