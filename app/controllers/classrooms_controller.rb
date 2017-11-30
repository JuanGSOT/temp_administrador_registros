class ClassroomsController < ApplicationController
  def index
    @classroom = Classroom.all
  end

  def show
    @classroom = Classroom.find(params[:id])
  end

  def new
    @classroom = Classroom.new
  end

  def edit
  end
  
  def create
    @classroom = Classroom.create(classroom_params)
    if @classroom.save
      flash[:notice] = "registro de nuevo salon agregado."
      redirect_to classrooms_path
    else
      @classroom.errors.each do |attr, msg|  
        flash[:alert] = msg
        end 
      redirect_to classrooms_path
    end
  end

  def update
    @classroom = Classroom.find(params[:id])

    if @classroom.update_attributes(classroom_params)
        flash[:notice] = "el nuevo salon se ah guardado."
        redirect_to classrooms_path
    else
      if @classroom.errors.any?  
        @classroom.errors.each do |attr, msg|  
          flash[:alert] = msg
          end 
        end 
        redirect_to classroom_path
    end
  end

  def destroy
    @classroom=Classroom.find(params[:id])
    @classroom.destroy
    
      flash[:notice] = "registro eliminado"
      redirect_to classrooms_path
  end

private
  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
