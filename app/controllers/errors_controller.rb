class ErrorsController < ApplicationController
  
  respond_to :json, :html
  
  def not_found
    respond_with({:message => "Not Found"}, :status => :not_found)
  end
  def internal_error
    respond_with({:message => "Internal Server Error"}, :status => :internal_server_error)                                             
  end
  
  def unprocessable_entity
    respond_with({:message => "Unprocessable Entity"}, :status => :unprocessable_entity)
  end

end