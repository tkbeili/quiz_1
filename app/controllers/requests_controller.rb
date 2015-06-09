class RequestsController < ApplicationController
  def index
    if params[:q]
      @requests = Request.search(params[:q]).page(params[:page]).per(10).order("done")
    else
      @requests = Request.page(params[:page]).per(10).order("done")
    end
  end

  def new
    @request = Request.new
  end

  def create
    request_params = params.require(:request).permit(:name,
                                                  :email, :department, :message)
    @request = Request.new request_params
    if @request.save
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  def edit
    @request = Request.find params[:id]
  end

  def show
    @request = Request.find params[:id]
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

  def update
    @request = Request.find params[:id]
    request_params = params.require(:request).permit(:name,
                                                  :email, :department, :message)
    if @request.update request_params
      redirect_to request_path(@request)
    else
      render :edit
    end
  end

  def done
    @request = Request.find params[:id]
    if @request.done
      @request.update(done: false)
    else
      @request.update(done: true)
    end

    redirect_to requests_path
  end
end
