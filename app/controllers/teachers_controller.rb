class TeachersController < ApplicationController
  def index
    @teacher = Teacher.new
    if params[:search]
      @teachers = Teacher.search(params[:search]).order("created_at DESC")
    else
      @teachers = Teacher.all.order('code ASC')
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
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
      flash[:alert] = "algo salio mal al guardar"
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @teacher_D=Teacher.find(params[:id])
    @teacher_D.destroy
    
      flash[:notice] = "registro eliminado"
      redirect_to teachers_path
  end

private

  def teacher_params
     params.require(:teacher).permit(:teacher, :department_id, :code, :name, :surnames, :contract, :status)
  end
end
