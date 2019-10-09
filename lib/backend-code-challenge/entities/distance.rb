class Distance < Hanami::Entity
  attributes do
    attribute :id,           Types::Int
    attribute :origin,       Types::String
    attribute :destination,  Types::String
    attribute :distance,     Types::Int.constrained(gt: 0, lt: 100001)
  end
end
