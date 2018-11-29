class PorfoliosController < ApplicationController
	def index
	  @porfolio_items = Porfolio.all
	end
end
