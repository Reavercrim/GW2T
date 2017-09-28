class OffersController < ApplicationController
  def listAll
	@offers = Offer.getEzOffers
  end
  
  def listArmors
	@offers = Offer.getEzArmors(params[:min],params[:max],params[:weight],params[:slot])
  end
  
  def listWeapons
	@offers = Offer.getEzWeapons(params[:min],params[:max],params[:type])
  end
  
end
