class RegistriesController < ApplicationController
  def index
    @registry = Registry.all.where(:return => nil)
  end

  def show
  end
  
  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.create(registry_params)
    if @registry.save
      @nueva_reserva = @registry.article
      @nueva_reserva.status = true
      @nueva_reserva.save
      flash[:notice] = "prestamo guardado"
      redirect_to root_path
    else
      flash[:alert] = "error al registrar datos"
      redirect_to new_registry_path
    end
  end

  def edit
    @registry = Registry.find(params[:id])
  end

  def update
    @registry = Registry.find(params[:id])
    @registry.return = Time.now - 6.hours
    if @registry.save
      @reserva = @registry.article
      @reserva.status = false
      @reserva.save
      flash[:notice] = "registro actualizado"
      redirect_to root_path
    else
      flash[:alert] = "error al actualizar datos"
      redirect_to new_registry_path
    end
  end

  def return 
    @registry = Registry.find(params[:id])    
  end

  def return_edit
    @registry = Registry.find(params[:id])
    render 'return'
  end

  def history

    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Combination chart"})
      f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
      f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
      f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
      f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
      f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
      f.series(:type=> 'pie',:name=> 'Total consumption', 
        :data=> [
          {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
          {:name=> 'John', :y=> 23,:color=> 'green'},
          {:name=> 'Joe', :y=> 19,:color=> 'blue'}
        ],
        :center=> [100, 80], :size=> 100, :showInLegend=> false)
    end

    @chart2 = LazyHighCharts::HighChart.new('graph') do |f|
      f.title(:text => "Population vs GDP For 5 Big Countries [2009]")
      f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
      f.series(:name => "GDP in Billions", :yAxis => 0, :data => [14119, 5068, 4985, 3339, 2656])
      f.series(:name => "Population in Millions", :yAxis => 1, :data => [310, 127, 1340, 81, 65])

      f.yAxis [
        {:title => {:text => "GDP in Billions", :margin => 70} },
        {:title => {:text => "Population in Millions"}, :opposite => true},
      ]

      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      f.chart({:defaultSeriesType=>"column"})
    end

    @chart3 = LazyHighCharts::HighChart.new('pie') do |f|
          f.chart({:defaultSeriesType=>"pie" , :margin=> [50, 200, 60, 170]} )
          series = {
                   :type=> 'pie',
                   :name=> 'Browser share',
                   :data=> [
                      ['Firefox',   45.0],
                      ['IE',       26.8],
                      {
                         :name=> 'Chrome',    
                         :y=> 12.8,
                         :sliced=> true,
                         :selected=> true
                      },
                      ['Safari',    8.5],
                      ['Opera',     6.2],
                      ['Others',   0.7]
                   ]
          }
          f.series(series)
          f.options[:title][:text] = "THA PIE"
          f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
          f.plot_options(:pie=>{
            :allowPointSelect=>true, 
            :cursor=>"pointer" , 
            :dataLabels=>{
              :enabled=>true,
              :color=>"black",
              :style=>{
                :font=>"13px Trebuchet MS, Verdana, sans-serif"
              }
            }
          })
    end

    @chart4 = LazyHighCharts::HighChart.new('column') do |f|
      f.series(:name=>'John',:data=> [3, 20, 3, 5, 4, 10, 12 ])
      f.series(:name=>'Jane',:data=>[1, 3, 4, 3, 3, 5, 4,-46] )     
      f.title({ :text=>"example test title from controller"})
      f.options[:chart][:defaultSeriesType] = "column"
      f.plot_options({:column=>{:stacking=>"percent"}})
    end

    
  end

private

  def registry_params
    params.require(:registry).permit(:article_id, :loan, :return, :user_id, :teacher_id, :classroom_id)
  end

end
