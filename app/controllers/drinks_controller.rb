class DrinksController < ApplicationController

  def index
    # will have template
    # Display / list of all drinks...
    @drinks = Drink.all
  end

  def show
    # will have template
    # more details a drinks...
    # display a record of individual instance
    @drink = Drink.find(params[:id])
  end

  def new
    # will have template
    # form for a new record
    # clinked save button... will go create method to save it in the dbase
    @drink = Drink.new
  end

  def create
    # no template, will save then redirect (do the action then redirect)
    # save the new record from the form (new method)
    @drink = Drink.new(allowed_params)

    if @drink.save
      redirect_to drinks_path
    else
      render 'new'
    end

  end

  def edit
    # will have template
    # display form (for the existing record)
    @drink = Drink.find(params[:id])
  end

  def update
    # no template, will save then redirect (do the action then redirect)
    # save changes
    # to save the form (from edit method)
    @drink = Drink.find(params[:id])

    if @drink.update_attributes(allowed_params)
      redirect_to drinks_path
    else
      render 'new'
    end
  end

  def destroy
    # no template, will destroy then redirect (do the action then redirect)
    # delete record(s)
    @drink = Drink.find(params[:id])
    @drink.destroy
    redirect_to drinks_path
  end

  private
    def allowed_params
      params.require(:drink).permit(:name, :size)
    end

end
