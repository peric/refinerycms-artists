module Refinery
  module Artists
    class Artist < Refinery::Core::BaseModel

      self.table_name = 'refinery_artists'

      attr_accessible :name, :slug, :location, :label, :songkick, :website, :facebook, :twitter, :bandcamp, :lastfm, :photo_id, :bio, :discography, :booking, :downloads, :availability, :position

      # add: website, facebook, twitter, bandcamp, last.fm, discogs
      # remove: links

      translates :bio, :availability

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :location, :label, :songkick, :website, :facebook, :twitter, :bandcamp, :lastfm, :bio, :discography, :booking, :downloads, :availability]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      before_save do
        self.slug = self.name.parameterize
      end

      def self.find(input)
        if input.is_a?(Integer)
          super
        else
          find_by_slug(input)
        end
      end
    end
  end
end
