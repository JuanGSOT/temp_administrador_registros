class RegistriesController < ApplicationController
  def index
    @registry = Registry.all.where(:status => true)
  end 

  def new
    @registry = Registry.new
  end

  def trigger_teacher_article(registry, val)
    # trigger articulo disponibilidad
    @nueva_reserva = registry.article
    @nueva_reserva.update(status: val)

    # trigger profesor disponibilidad
    @teacher_reserva = registry.teacher
    @teacher_reserva.update(status: val)

    # trigger salon disponibilidad
    @teacher_reserva = registry.classroom
    @teacher_reserva.update(status: val)
  end

  def service(registry)
    # obtener horas de servicio
    difference_time = (registry.created_at - registry.updated_at).abs
    difference_time = Time.at(difference_time).utc.strftime "%H:%M:%S"
    
    @service = registry.article
    @service.update(service: difference_time)
  end

  def create
    @registry = Registry.create(registry_params)
    # activa la lista de solicitudes hechas > prestamos en curso
    @registry.status = true

    if @registry.save
      self.trigger_teacher_article(@registry, true)
      flash[:notice] = "prestamo guardado"
      redirect_to root_path
    else
      flash[:alert] = "error al registrar datos"
      redirect_to new_registry_path
    end
  end
  
  def update
    @registry = Registry.find(params[:id])
    # activa la lista de solicitudes hechas > prestamos en curso    
    @registry.status = false

    if @registry.save
      self.trigger_teacher_article(@registry, false)
      self.service(@registry)
      flash[:notice] = "registro actualizado \n ya se encuentra disponible el #{@registry.article.name}"
      if Registry.all.where(:status => true).count > 0
        redirect_to registries_path
      else
        redirect_to root_path
      end
    else
      flash[:alert] = "error al actualizar datos"
      redirect_to registries_path
    end
  end

  def history
  end

private

  def registry_params
    params.require(:registry).permit(:article_id, :user_id, :teacher_id, :classroom_id)
  end

end
