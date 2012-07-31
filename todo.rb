require 'rubygems'
require 'sinatra'
require 'csv'
require 'FileUtils'

FileUtils.touch("tasks.csv")

not_found do
  status 404
  'page not found'
end

get '/' do
  erb :home
end

get '/all' do
  @render_tasks = CSV.read("tasks.csv")
  erb :all
end

get '/new' do
  @render_tasks = CSV.read("tasks.csv")
  erb :new
end

post '/new' do
  Todo.new.create(params[:new_task])
  @render_tasks = CSV.read("tasks.csv")
  erb :new_output
end

get '/complete' do
  @render_tasks = CSV.read("tasks.csv")
  erb :complete
end

post '/complete' do
  Todo.new.complete(params[:complete])
  @render_tasks = CSV.read("tasks.csv")
  erb :complete_output
end


class Todo
  
  def all
  end
  
  def create(description)
    old_tasks = CSV.read("tasks.csv")
    all_tasks = CSV.open("tasks.csv", "w")
    i = old_tasks.size

    num = 0
    while num < i do
      all_tasks << old_tasks[num]
      num += 1
    end
    all_tasks << ["#{description}"]
    all_tasks.close
  end
  
  def complete(number)
    num = 0
    complete_num = "#{number}".to_i - 1
    
    old_tasks = CSV.read("tasks.csv")
    all_tasks = CSV.open("tasks.csv", "w")
    i = old_tasks.size

    while num < i do
      if num != complete_num
        all_tasks << old_tasks[num]
      end
      num += 1
    end
    all_tasks.close
  end
      
end
