# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
    #   argument :id, ID, required: true, description: "ID of the object."
    # end

    # def node(id:)
    #   context.schema.object_from_id(id, context)
    # end

    # field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
    #   argument :ids, [ID], required: true, description: "IDs of the objects."
    # end

    # def nodes(ids:)
    #   ids.map { |id| context.schema.object_from_id(id, context) }
    # end

    # # Add root-level fields here.
    # # They will be entry points for queries on your schema.

    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :items, [Types::ItemType], null: false, description: "Return a list of items"
    field :item, Types::ItemType, null: false, description: "Return an item" do
      argument :id, ID, required: true, description: "Get item by id" 
    end
    field :artists, [Types::ArtistType], null: false, description: "Return a list of artists"
    field :artist, Types::ArtistType, null: false, description: "Return an artist" do
      argument :id, ID, required: true, description: "Find Artist by id"
    end

    def items
      Item.all
    end

    def item(id:) 
      Item.find(id)
    end

    def artists
      Artist.all
    end

    def artist(id:)
      Artist.find(id)
    end
  end
end
