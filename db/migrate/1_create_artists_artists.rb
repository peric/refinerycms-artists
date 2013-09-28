class CreateArtistsArtists < ActiveRecord::Migration

  def up
    create_table :refinery_artists do |t|

      t.string :name

      t.string :location

      t.string :label

      t.string :songkick

      t.string :website

      t.string :facebook

      t.string :twitter

      t.string :bandcamp

      t.string :lastfm

      t.integer :photo_id

      t.text :bio

      t.text :discography

      t.text :booking

      t.text :downloads

      t.string :availability

      t.integer :position

      t.timestamps
    end

    Refinery::Artists::Artist.create_translation_table!({
      :bio => :text,
      :availability => :string
    })

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-artists"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/artists/artists"})
    end

    drop_table :refinery_artists

    Refinery::Artists::Artist.drop_translation_table!

  end

end
