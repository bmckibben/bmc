class HomeController < ApplicationController
 
  skip_before_action :authenticate_user! 

  def index
    render layout: "home"
  end

  def contact
  	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~"
  	puts params.inspect
  	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~"
  	HomeMailer.new_message(params[:contact][:name],params[:contact][:email],params[:contact][:message]).deliver_now
  	@message = "Thank you for your message!"
  	respond_to do |format|
  		format.html {

  		}
  		format.js {
  			flash.now[:notice] = "Quote was successfully created." 
  		}
  	end
  end
end
