class OrdersController < ActionController::Base

  def index
    @orders = Order.all  
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Arbeitgeber wurde erfolgreich erstellt!"
      redirect_to :action => 'new'            
    else
      render 'edit'
    end  
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
  	@order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:success] = "Auftraggeber aktualisiert"
      redirect_to (orders_url)
    else 
      render 'edit'
    end
  end

  private 

  def order_params
    params.require(:order).permit(
    	:employer, :employee, :start_time,
      :end_time, :date, :working_hours, :hourly_compensation,
      :employee_hourly_compensation, :break_in_minutes
    )
  end
end
