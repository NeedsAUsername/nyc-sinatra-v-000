class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    if !params[:title].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    if !params[:landmark].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end

    redirect "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    @figure = Figure.find_by_id(params[:figure])
    @figure.name = params[:figure][:name]

    @figure 

    erb :'/figures/show'
  end

end
