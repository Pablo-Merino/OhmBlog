class Tag < Ohm::Model
  attribute :label
  reference :post, :Post
end
