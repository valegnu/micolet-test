Rails.application.routes.draw do

  scope "(:locale)", locale: /en|es/ do
    root 'suscriptions#new'
    post 'new_suscription', to: 'suscriptions#create'
  end

end
