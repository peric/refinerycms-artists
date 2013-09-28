Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :artists do
    resources :artists, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :artists, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :artists, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
