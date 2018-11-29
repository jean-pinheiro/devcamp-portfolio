class PorfoliosController < ApplicationController
  def index
    @porfolio_items = Porfolio.all
  end

  def new
    @porfolio_item  = Porfolio.new
  end

  def create
    @porfolio_item = Porfolio.new(params.require(:porfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @porfolio_item.save
        format.html { redirect_to porfolios_path, notice: 'Your porfolio item is now live.' }
        
      else
        format.html { render :new }
       
      end
    end
  end

  def edit
  	@porfolio_item = Porfolio.find(params[:id])
  end

  def update
  	@porfolio_item = Porfolio.find(params[:id])

    respond_to do |format|
      if @porfolio_item.update(params.require(:porfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to porfolios_path, notice: 'The record successfully updated.' }
      
      else
        format.html { render :edit }
        
      end
    end
  end

  def show
    @porfolio_item = Porfolio.find(params[:id])
  end

  def destroy
    #perform the lookup
    @porfolio_item = Porfolio.find(params[:id])

    #destroy/delete the record
    @porfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to porfolios_url, notice: 'Record was removed.' }
     
    end
  end

end
