# frozen_string_literal: true

module Mutations
  class ItemUpdate < BaseMutation
    description "Updates a item by id"

    field :item, Types::ItemType, null: false

    argument :id, ID, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :artist_id, ID, required: true

      def resolve(id:, title:, description:, artist_id:)
      item = ::Item.find(id)
      raise GraphQL::ExecutionError.new "Error updating item", extensions: item.errors.to_hash unless item.update(title:, description:, artist_id:)

      { item: item }
    end
  end
end
