class CollectionsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @collections = Collection.all
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = Collection.new(params[:collection])
    if @collection.save
      redirect_to @collection, :notice => "Successfully created collection."
    else
      render :action => 'new'
    end
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    if @collection.update_attributes(params[:collection])
      redirect_to @collection, :notice  => "Successfully updated collection."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    redirect_to collections_url, :notice => "Successfully destroyed collection."
  end
end
