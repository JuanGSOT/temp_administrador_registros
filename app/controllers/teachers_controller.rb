class TeachersController < ApplicationController
  def index
    @teacher = Teacher.new
    if params[:search]
      @teachers = Teacher.search(params[:search]).order("created_at DESC")
    else
      @teachers = Teacher.all.order('code ASC')
    end
    if params[:id]
      @teacher_find = Teacher.find_by(code: params[:id])
    end
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)
    if @teacher.save
      flash[:notice] = "registro de profesor agregado."
      redirect_to teachers_path
    else
      #flash[:alert] = "algo salio mal al guardar!"
      if @teacher.errors.any?  
        @teacher.errors.each do |attr, msg|  
          flash[:alert] = msg
        end 
      end 
      redirect_to root_path
    end
  end

  def edit
    
  end

  def update
      @teacher_find = Teacher.find_by(code: params[:id])
    
      if @teacher_find.update_attributes(teacher_params)
        flash[:notice] = "registro de profesor actualizado."
        redirect_to teachers_path
      else
        flash[:alert] = "algo salio mal al actualizar!"
        redirect_to root_path
      end
  end

  def destroy
    @teacher_D=Teacher.find_by(code: params[:id])
    @teacher_D.destroy
    
      flash[:notice] = "registro eliminado"
      redirect_to teachers_path
  end

private

  def teacher_params
     params.require(:teacher).permit(:department_id, :code, :name, :surnames, :contract, :status)
  end
end
