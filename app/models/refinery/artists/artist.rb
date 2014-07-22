module Refinery
  module Artists
    class Artist < Refinery::Core::BaseModel

      self.table_name = 'refinery_artists'

      attr_accessible :name, :location, :label, :songkick, :website, :facebook, :twitter, :bandcamp, :lastfm, :photo_id, :bio, :discography, :booking, :downloads, :availability, :position

      # add: website, facebook, twitter, bandcamp, last.fm, discogs
      # remove: links

      translates :bio, :availability

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :location, :label, :songkick, :website, :facebook, :twitter, :bandcamp, :lastfm, :bio, :discography, :booking, :downloads, :availability]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'

      def to_param
        name.parameterize
      end
    end
  end
end
