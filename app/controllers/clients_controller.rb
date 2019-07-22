class ClientsController < ApplicationController
  layout "client_layout"

  def index
    if params[:search]
      @clients = Client.search(params[:search])
      if @clients.blank?
        flash.now[:notice] = "No such Clients Found"
      end
    else
      @clients = Client.all
    end
  end

  def show 
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new()
  end

  def edit 
    @client = Client.find(params[:id])
  end

  def create 
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = "New Client Created" 
      redirect_to @client
    else
      flash[:notice] = "FAILED to create New Client " 
      render 'new'
    end
  end

  def update 
    @client = Client.find(params[:id])

    if (@client.update(client_params))
      flash[:notice] = "Client Info Successfully Edited" 
      redirect_to @client
    else
      flash[:notice] = "FAILED to Update Client Info" 
      render 'edit'
    end
  end

  def destroy 
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = "Client Info Successfully Deleted" 
    redirect_to clients_path
  end

  private def client_params 
    params.require(:client).permit(:name, :email)
  end

end
