class ArtistsAddSlug < ActiveRecord::Migration
  def up
    add_column :artists, :slug, :string

    Artists.find_each do |artist|
      artist.slug = artist.name.parameterize
      artist.save!
    end
  end

  def down
    remove_column :artists, :slug
  end
end
