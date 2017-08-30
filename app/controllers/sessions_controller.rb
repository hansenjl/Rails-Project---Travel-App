class SessionsController < ApplicationController

  def destroy
    session.delete :user_id
  end
end