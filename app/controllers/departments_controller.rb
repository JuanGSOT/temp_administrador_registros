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
    else
      flash[:alert] = "Algo salio mal al guardar!"
    end

    redirect_to departments_path
  end

  def update
    @department_find = Department.find(params[:id])
    
      if @department_find.update_attributes(department_params)
        flash[:notice] = "Departamento actualizado."
      else
        flash[:alert] = "Algo salio mal al actualizar!"
      end
      
      redirect_to departments_path
  end

  def destroy
    @department = Department.find(params[:id])
    @check_dep = Department.find(params[:id]).teachers.count()

    if @check_dep > 0
      flash[:alert] = "Imposible de borrar!!! ya que existen profesores asignados a este departamento"
    else
      @department.destroy
      flash[:notice] = "El registro del departamento ha sido eliminado"
    end
    
    redirect_to departments_path
  end

private

  def department_params
    params.require(:department).permit(:name, :abbrev, :apartment_manager)
  end
end
