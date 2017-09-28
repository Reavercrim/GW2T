Rails.application.routes.draw do
  get 'offers/listAll'
  get 'offers/listArmors/:min/:max/:weight/:slot', to: 'offers#listArmors'
  get 'offers/listWeapons/:min/:max/:type', to: 'offers#listWeapons'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
