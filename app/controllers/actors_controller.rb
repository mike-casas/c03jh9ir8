class ActorsController < ApplicationController
  def index
    @actors= Actor.all
  end

  def new
    @actor= Actor.new
  end

  def create
    @actor= Actor.create(params_actor)
    if @actor.save
      redirect_to actors_path
      flash[:notice]="creado correctamente"
    else
      render 'new'
    end
  end

  private

  def params_actor
    params.require(:actor).permit(:name,:bio,:birth_date,:birth_place,:image_url,:alive,:death_date,:death_place)
  end
end
