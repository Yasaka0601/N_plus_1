class PokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
    #@pokemons = Pokemon.includes(:trainer)
  end
end
