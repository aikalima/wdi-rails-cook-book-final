class StatsController < ApplicationController

  def stats
  end

  def data
    data = [
            { y: 'Books', a: Book.count },
            { y: 'Recipes', a: Recipe.count },
            { y: 'Ingredients', a: Ingredient.count}
    ]

    render :json  => data
  end

end
