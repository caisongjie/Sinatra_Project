require 'sinatra'
require 'erb'
require_relative 'students'

use Rack::Session::Cookie

configure do
  enable :session
  set :username,"coen164" 
  set :password, "123456" 

end

DataMapper.setup(:default, ENV["DATABASE_URL"] || "sqlite3://#{Dir.pwd}/students.db")
DataMapper.auto_upgrade!

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/login' do
  erb :login
end

post '/login' do
  if params[:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    puts session[:admin]
    redirect to('/')
  else
    redirect to('/login')
  end
  
end

get "/logout" do
  session[:admin] = nil
  redirect to("/")
end

get '/video' do
  erb :video
end

get '/students' do
  @students = Students.all
  erb :students
end

get '/students/create' do
  redirect to("/login") unless session[:admin]
  erb :student_create
end

post '/students/create' do
  redirect to("/login") unless session[:admin]
  if Students.create(
	firstname: params[:firstname] ,
	lastname: params[:lastname],
	birthday: params[:birthday],
	address: params[:address],	
	)
  else
    halt "create student failed"
  end
  redirect to('/students')
end

get '/students/:id' do
  redirect to("/login") unless session[:admin]
  @student = Students.get(params[:id])
    if @student
    erb :student_info
  else
    halt 404
  end
end

get '/students/:id/edit' do
  redirect to("/login") unless session[:admin]
  @student = Students.get(params[:id])
  if @student
    erb :student_edit
  else
    halt 404
  end
end

post '/students/:id/edit' do
  redirect to("/login") unless session[:admin]
  @student = Students.get(params[:id])
  if @student
    @student.firstname = params[:firstname]
    @student.lastname = params[:lastname]
    @student.birthday = params[:birthday]
    @student.address = params[:address]
    @student.save
  else
    halt 404
  end
  redirect to('/students')
end

get '/students/:id/delete' do
  redirect to("/login") unless session[:admin]
  Students.get(params[:id]).destroy
  redirect to('/students')
end

get '/comment' do
  @comments = Comment.all
  erb :comment
end

get '/comment/create' do
  erb :comment_create
end

post '/comment/create' do
  if Comment.create(
	name: params[:name] ,
	comment: params[:comment],	
	)
  else
    halt "create comment failed"
  end
  redirect to('/comment')
end

get '/comment/:id' do
  @comment = Comment.get(params[:id])
  erb :comment_info
end

