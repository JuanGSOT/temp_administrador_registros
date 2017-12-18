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
    # es necesario indica code de profesor ya que este es completamente distinto de su identificador en cada registro
    query_find = Registry.all.where(:teacher_id => Teacher.find_by(code: registry_params['teacher_id']).id, :status => true).count

    if query_find > 0
        redirect_to new_registry_path
        flash[:alert] = 'Este profesor ya tiene un registro'
    else
      @registry = Registry.create(registry_params)
      @registry.teacher_id = Teacher.find_by(code: registry_params['teacher_id']).id
      # activa la lista de solicitudes hechas > prestamos en curso
      @registry.status = true

      if @registry.save
        self.trigger_teacher_article(@registry, true)
        flash[:notice] = 'Prestamo guardado.'
        redirect_to root_path
      else
        @registry.errors.each do |attr, msg|  
        #flash[:alert] = 'Error al registrar datos!'
          flash[:alert] = "#{attr} #{msg}"
        end
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
    if params[:teacher_id].present? && params[:option].present?
      @registry = Registry.search(params[:teacher_id], params[:page], Registry.filtro(params[:option])).order('id DESC')
      @message = titulo(params[:option])

    elsif params[:option].present?
      @registry = Registry.option(params[:option]).order('id DESC')
      @message = titulo(params[:option])

    elsif params[:since].present? && params[:until].present?
      @registry = Registry.filtro_maestro(params[:since],params[:until]).order('id DESC')
      @message = "Filtro entre las fechas #{params[:since]} - #{params[:until]}"

    else
      @registry = Registry.search(params[:teacher_id], params[:page]).where(:status => false).order('id DESC')
      @message = "Todos los registros existentes"
    end

    # datos de profesores por departamento que utilizan el proyector sigo sin indicar fechas
    # @chart_1, @labels_chart, @chart_color_used, @chart_border_used, @chart_background_used = [], [], [], [], []
    # @color_chart = ["rgba(255, 99, 132, 0.2)", "rgba(54, 162, 235, 0.2)", "rgba(255, 206, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(153, 102, 255, 0.2)", "rgba(255, 159, 64, 0.2)"]
    # @border_chart = ["#FF6384", "#36A2EB", "#FFCE56", "#4BC0C0", "#96F", "#FF9F40"]
    # @background_chart = ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"]

    # Department.all.each do |t|
    #   @chart_1 << @registry.where(teacher_id: Teacher.where(department_id: t.id)).count
    #   @labels_chart << t.name
    # end
    # for i in 0..(@chart_1.length - 1)
    #     @chart_color_used << @color_chart[i]
    #     @chart_border_used << @border_chart[i]
    #     @chart_background_used << @background_chart[i]
    # end
    # datos de profesores por departamento que utilizan el proyector sigo sin indicar fechas
  end

  def titulo(opc)
    opc = opc.to_i
    case opc
    when 1
      a = "Filtro por semana"
    when 2
      a = "Filtro por mes"
    when 3
      a = "Filtro por semestre"
    when 4
      a = "Filtro por año"
    else
      a = "Filtro especial"
    end 
    return a
  end

  def destroy
    @registry = Registry.find(params[:id])
    @registry.destroy
    
    flash[:notice] = "El registro se ha eliminado!"
    
    redirect_to history_registry_path
  end

private
  def registry_params
    params.require(:registry).permit(:article_id, :user_id, :teacher_id, :classroom_id)
  end
end