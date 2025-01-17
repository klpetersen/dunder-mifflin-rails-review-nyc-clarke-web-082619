class EmployeesController < ApplicationController

    before_action :find_employee, only: [:show, :edit, :update]

    def index 
        @employees = Employee.all 
        render :index
    end 

    def show 
        render :show 
    end 

    def new 
        @employee = Employee.new
        render :new
    end 

    def create 
        @employee = Employee.create(employee_params)
        redirect_to employee_path(@employee)
    end 

    def edit
        render :edit  
    end 

    def update
        @employee.update(employee_params)
        redirect_to employee_path
    end 

    private 

    def find_employee
        @employee = Employee.find(params[:id])
    end 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end 


end
