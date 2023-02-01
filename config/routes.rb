Rails.application.routes.draw do
  # devise_for :users
  root to: "pages#home"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # La liste des laboratoires
      # Un classement des produits les plus rentable pour un laboratoire donnée
      resources :laboratories, only: [ :index, :show ]
      # La liste des pharmacies avec un filtre par ville possible
      resources :pharmacies, only: [ :index ]
      # creation d'une commande entre pharmacie et laboratoire
      resources :orders, only: [ :create ]
      # creation d'une vente de la pharmacie
      resources :sales, only: [ :create ]

      # Un classement des villes puis des 3 meilleures pharmacies (si il y a) pour un laboratoire donnée

    end
  end
end
