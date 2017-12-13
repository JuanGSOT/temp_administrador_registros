class ClassroomsController < ApplicationController
  def index
    @classroom = Classroom.all.where(live: true)
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
    @finder = Classroom.find_by(name: classroom_params['name'].upcase)
    if Classroom.exists?(name: classroom_params['name'].upcase) && (@finder.live == false)
      Classroom.find_by(name: classroom_params['name'].upcase).update(live: true)
    else
      @classroom = Classroom.create(classroom_params)
      @classroom.name = classroom_params['name']
        if @classroom.save
          flash[:notice] = "Nuevo salón agregado."
        else
          @classroom.errors.each do |attr, msg|  
            flash[:alert] = msg
          end
        end
      end

    redirect_to classrooms_path
  end

  def update
    @classroom = Classroom.find(params[:id])

    if @classroom.update_attributes(classroom_params)
      flash[:notice] = "Los datos del salón se han actualizado."
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
    @classroom = Classroom.find(params[:id])
    @classroom.live = false
    
    if @classroom.save
      flash[:notice] = "Se ha eliminado satisfactoriamente."
    end

    redirect_to classrooms_path
  end

private
  def classroom_params
    params.require(:classroom).permit(:name)
  end
end
