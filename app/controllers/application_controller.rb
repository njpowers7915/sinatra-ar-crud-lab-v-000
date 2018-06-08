require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  get '/posts/new' do
    erb :new
  end
  
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    erb :index
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  get '/posts/:id' do
    @post = Post.all.find_by(id: params[:id])
    erb :show
  end
  
  get '/posts/:id/edit' do
    @post = Post.all.find_by(id: params[:id])
    erb :edit
  end
  
  patch '/posts/:id' do
    #@post = @post.update(id: params[:id])]
    @post = Post.all.find_by(id: params[:id])
    @post.update(name: params[:name], content: params[:content])
    @post.save
    erb :show
  end
  
  delete '/posts/:id/delete' do
    @post = Post.all.find_by(id: params[:id])
    @post.destroy
    erb :delete
  end
end
