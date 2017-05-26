class TwsController < ApplicationController
  before_action :set_tw, only:[:edit,:update,:destroy]
  def index
    @tws = Tw.all
  end
  
  def new
    if params[:back]
      @tw = Tw.new(tws_params)
    else
      @tw = Tw.new
    end
  end
  
  def create
    @tw = Tw.new(tws_params)
    if @tw.save
      redirect_to tws_path
    else
      render 'new'
    end
  end
  
  def edit
    @tw = Tw.find(params[:id])
  end
  
  def update
    @tw = Tw.find(params[:id])
    @tw.update(tws_params)
    redirect_to tws_path
  end
  
  def destroy
    @tw =Tw.find(params[:id])
    @tw.destroy
    redirect_to tws_path
  end
  
  def confirm
    @tw = Tw.new(tws_params)
    render :new if @tw.invalid?
  end
  
  private
    def tws_params
      params.require(:tw).permit(:content)
    end
    
    def set_tw
      @tw = Tw.find(params[:id])
    end
end
