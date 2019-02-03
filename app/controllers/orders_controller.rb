require [Dir.pwd, 'app', 'models', 'employee'].join('/')
require [Dir.pwd, 'app', 'models', 'employer'].join('/')

class OrdersController < ActionController::Base

  def index
    @orders = Order.all
  end

  def new
    @employee_lastnames = Employee.pluck(:lastname)
    @employer_names = Employer.pluck(:name)

    @order = Order.new
  end

  def create
    employer = fetch_employer_by_name(order_params[:employer_id])
    employee = fetch_employee_by_lastname(order_params[:employee_id])
    order_correct_params = order_params
    order_correct_params[:employer_id] = employer.id
    order_correct_params[:employee_id] = employee.id

    @order = Order.new(order_correct_params)
    if @order.save
      flash[:notice] = "Arbeitgeber wurde erfolgreich erstellt!"
      redirect_to :action => 'index'            
    else
      render 'edit'
    end  
  end

  def edit
    @order = Order.find(params[:id])

    @selected_employee_name = @order.employee.lastname
    @selected_employer_name = @order.employer.name
    @employee_lastnames = Employee.pluck(:lastname)
    @employer_names = Employer.pluck(:name)
  end

  def update
  	employer = fetch_employer_by_name(order_params[:employer_id])
    employee = fetch_employee_by_lastname(order_params[:employee_id])
    order_correct_params = order_params
    order_correct_params[:employer_id] = employer.id
    order_correct_params[:employee_id] = employee.id

    if @order.update_attributes(order_correct_params)
      flash[:success] = "Auftrag aktualisiert"
      redirect_to (orders_url)
    else 
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to orders_path
  end

  private 

  def order_params
    params.require(:order).permit(
    	:employer_id, :employee_id, :start_time,
      :end_time, :date, :working_hours, :hourly_compensation,
      :employee_hourly_compensation, :break_in_minutes
    )
  end

  def fetch_employer_by_name(name)
    Employer.find_by_name(name)
  end

  def fetch_employee_by_lastname(lastname)
    Employee.find_by_lastname(lastname)
  end
end
