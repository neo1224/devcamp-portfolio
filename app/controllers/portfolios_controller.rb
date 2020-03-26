class PortfoliosController < ApplicationController
 #before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
	def index 
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end
	
	
	def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
     end
    end

    def edit
    	@portfolio_item = Portfolio.find(params[:id])
    end

    def update
    	@portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio record was successfully updated.' }
        else
        format.html { render :edit }
      end
    end
  end

    # def set_portfolio
    #   @portfolio_item = Portfolio.find(params[:id])
    # end

    # def portfolio_params
    #   params.require(:blog).permit(:title, :body)
    # end

end
