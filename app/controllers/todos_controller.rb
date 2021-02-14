class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  #POST
  def create
    @todo = Todo.new(todo_params)
    @todo.done = false
    if @todo.save
      flash[:msg] = "TODOs nr. #{@todo.id} created successfully"
      redirect_to todo_path(@todo) #show
    else
      flash[:msg] = @todo.errors.full_messages[0]
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  #GET
  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:msg] = "TODOs nr. #{@todo.id} edited successfully"
      redirect_to action: "index"
    else
      flash[:msg] = @todo.errors.full_messages[0]
      render 'edit'
    end
  end

  def index
    @todos = Todo.all
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:msg] = "TODOs nr. #{@todo.id} DELETED"
    redirect_to action: "index"
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :description, :important, :done)
  end
end
