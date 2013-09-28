module Refinery
  module Artists
    module Admin
      class ArtistsController < ::Refinery::AdminController

        crudify :'refinery/artists/artist',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
