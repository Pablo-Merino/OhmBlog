class Post < Ohm::Model
  include Ohm::Timestamps

  attribute :title
  attribute :content

  attribute :cover_post
  index :cover_post

  collection :tags, :Tag
end
