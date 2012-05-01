class UserController < ApplicationController
  def index
    @id = cookies.signed[:uid]
    respond_to do |format|
      format.html {render :text => @id}
    end
  end

end
