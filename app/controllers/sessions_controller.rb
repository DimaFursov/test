class SessionsController < ApplicationController
  # get (При выполнении new будут в том числе созданы и представления, поэтому мы здесь не указываем действия create и destroy, у которых нет представлений.)
  def new
  end
  # post
  def update
  end
  # GET
  def show
  end
  # delete DELETE к маршруту logout.
  def destroy
  end
end