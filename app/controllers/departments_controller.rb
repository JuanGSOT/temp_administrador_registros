class DepartmentsController < ApplicationController
  def index
    @chart3 = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie" , :margin=> [40, 200, 60, 170]} )
      f.series({:type=> 'pie', :name=> 'Prestamos a profesores', :data=> [ ['Pantalla',   10.0],['Proyector',       46.8],
           {
              :name=> 'Cables',    
              :y=> 12.8,
              :sliced=> true,
              :selected=> true
           },
           ['Tazas',    8.5]
        ]
      })
      f.options[:title][:text] = "Prestamos realizados en el mes"
      f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer" , 
        :dataLabels=>{
          :enabled=>true,
          :format=> '<b>{point.name}</b>: {point.percentage:.1f} %',
          :color=>"black",
          :style=>{
            :font=>"20px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
    end
    @department = Department.new
    @departments = Department.all
  end

  def create
    @department = Department.create(department_params)
    if @department.save
      flash[:notice] = "registro de profesor agregado."
      redirect_to departments_path
    else
      flash[:alert] = "algo salio mal al guardar"
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
