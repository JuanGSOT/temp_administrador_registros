class DepartmentsController < ApplicationController
  def index
    
    @department = Department.new
    @departments = Department.all
    if params[:id]
      @department_find = Department.find(params[:id])
    end
  end

  def create
    @department = Department.create(department_params)
    if @department.save
      flash[:notice] = "Departamento agregado."
      redirect_to departments_path
    else
      flash[:alert] = "algo salio mal al guardar!"
      redirect_to root_path
    end
  end

  def update
    @department_find = Department.find(params[:id])
    
      if @department_find.update_attributes(department_params)
        flash[:notice] = "Departamento actualizado."
        redirect_to departments_path
      else
        flash[:alert] = "algo salio mal al actualizar!"
        redirect_to root_path
      end
  end

  def destroy
    @department = Department.find(params[:id])
    @department.destroy
    
      flash[:alert] = "El registro del departamento ha sido eliminado"
      redirect_to departments_path
  end

private

  def department_params
    params.require(:department).permit(:name, :apartment_manager)
  end
end
