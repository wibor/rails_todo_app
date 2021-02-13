class PagesController < ApplicationController

  def hello
    render plain: "Hello World"
  end

  def home
    @msg = "Hello World?"
  end

  def about

  end

end


