class TodosController < ApplicationController

  def new
    @todo = Todo.new
  end

  #POST
  def create
    @todo = Todo.new(todo_params)
    @todo.done = false
    if @todo.save
      flash[:msg] = 'TODOs created successfully'
      redirect_to todo_path(@todo) #show
    else
      flash[:msg] = @todo.errors.full_messages[0]
      render 'new'
    end
  end

  def show
    @todos = Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :description, :important)
  end
end
