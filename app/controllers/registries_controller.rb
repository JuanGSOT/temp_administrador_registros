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
    inicio = registry.created_at.to_i
    fin = registry.updated_at.to_i

    # tener la diferencia
    difference_time = ( fin - inicio )

    data_s = registry.article
    difference_time += data_s.service     # registrar la suma de lo actual registrado con el nuevo tiempo
    data_s.update(service: difference_time)
  end

  def get_service(registry)
    inicio = registry.created_at.to_i
    fin = registry.updated_at.to_i

    diff = (fin - inicio)

    if diff < 86400 
      return Time.at(diff).utc.strftime "%H:%M:%S"
    else
      return Time.at(diff).utc.strftime "#{(diff / 86400).to_i} dia(s) %H:%M:%S"
    end

  end
  helper_method :get_service

  def create
    query_find = Registry.all.where('teacher_id like ? AND status like ?', registry_params['teacher_id'] , true).count
    if query_find > 0
        redirect_to new_registry_path
        flash[:alert] = 'Este profesor ya tiene un registro'
    else
      @registry = Registry.create(registry_params)
      # activa la lista de solicitudes hechas > prestamos en curso
      @registry.status = true

      if @registry.save
        self.trigger_teacher_article(@registry, true)
        flash[:notice] = 'prestamo guardado'
        redirect_to root_path
      else
        flash[:alert] = 'error al registrar datos'
        redirect_to new_registry_path
      end
    end
  end
  
  def update
    @registry = Registry.find(params[:id])
    # desactiva la lista de solicitudes hechas > prestamos en curso    
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
      flash[:alert] = 'error al actualizar datos'
      redirect_to registries_path
    end
  end

  def history
    @registryed = Registry.all.where(:status => false).order('id DESC')
    @registry = Registry.search(params[:teacher_id], params[:page]).order('id DESC')
  end

private

  def registry_params
    params.require(:registry).permit(:article_id, :user_id, :teacher_id, :classroom_id)
  end

end
