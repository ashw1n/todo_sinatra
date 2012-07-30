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
  erb :all
end

get '/new' do
  erb :new
end

post '/new' do
  erb :new_output
end

get '/complete' do
  erb :complete
end

post '/complete' do
  erb :complete_output
end


class Todo
  
  def all
  end
  
  def create
    old_tasks = CSV.read("tasks.csv")
    all_tasks = CSV.open("tasks.csv", "w")
    i = old_tasks.size

    num = 0
    while num < i do
      all_tasks << old_tasks[num]
      num += 1
    end
    all_tasks << ["#{ARGV[1]}"]
    all_tasks.close
  end
  
  def complete
    num = 0
    input_num = ARGV[1]
    complete_num = input_num.to_i - 1
    
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
  
    #if ARGV[0] == "all"
    #  ToDo.new.all
    #elsif ARGV[0] == "new"
    #  ToDo.new.create
    #else ARGV[0] == "complete"
    #  ToDo.new.complete
    #end

    #all_tasks = CSV.read("tasks.csv")
    #all_tasks.each_with_index {|l, index| puts (index + 1).to_s + ". " + l.to_s}
    
end
