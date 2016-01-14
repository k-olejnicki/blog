class AddYoutubeUrlToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :youtube_url, :string
  end
end
