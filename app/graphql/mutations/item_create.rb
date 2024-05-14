# frozen_string_literal: true

module Mutations
  class ItemCreate < BaseMutation
    description "Creates a new item"

    field :item, Types::ItemType, null: false

    argument :title, String, required: true
    argument :description, String, required: true
    argument :artist_id, ID, required: true

    def resolve(title:, description:, artist_id:)
      item = ::Item.new(title:, description:, artist_id:)
      raise GraphQL::ExecutionError.new "Error creating item", extensions: item.errors.to_hash unless item.save

      { item: item }
    end
  end
end
