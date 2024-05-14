# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :item_delete, mutation: Mutations::ItemDelete
    field :item_update, mutation: Mutations::ItemUpdate
    field :item_create, mutation: Mutations::ItemCreate
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
