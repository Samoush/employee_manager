class EmployersController < ActionController::Base

  def index
    @employers = Employer.all  
  end

  def new
    @employer = Employer.new
  end

  def create
    @employer = Employer.new(employer_params)
    if @employer.save
      flash[:notice] = "Arbeitgeber wurde erfolgreich erstellt!"
      redirect_to :action => 'new'            
    else
      render 'edit'
    end  
  end

  def edit
    @employer = Employer.find(params[:id])
  end

  def update
  	@employer = Employer.find(params[:id])
    if @employer.update_attributes(employer_params)
      flash[:success] = "Auftraggeber aktualisiert"
      redirect_to (employers_url)
    else 
      render 'edit'
    end
  end

  private 

  def employer_params
    params.require(:employer).permit(
    	:name, :address, :contact_person, :telephone, :email, :website, 
    	:night_addition_in_percent, :sunday_addition_in_percent, :holiday_addition_in_percent, :created_at, :updated_at
    )
  end
end
