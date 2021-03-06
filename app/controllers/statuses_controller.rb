class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @statuses = Status.all
    respond_with(@statuses)
  end

  def show
    respond_with(@status)
  end

  def new
    @status = current_user.statuses.new
    respond_with(@status)
  end

  def edit
  end

  def create
    @status = current_user.statuses.new(status_params)
    @status.save
      flash[:success] = "Cadastrado com sucesso" 
    respond_with(@status)
  end

  def update
    @status.update(status_params)
    respond_with(@status)
  end

  def destroy
    @status.destroy
    respond_with(@status)
  end

  private
    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:name, :content, :user_id)
    end
end
