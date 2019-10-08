class DistanceRepository < Hanami::Repository
  def origin(origin)
    distances.where(origin: origin).to_a
  end

  def destination(destination)
    distances.where(destination: destination).to_a
  end

  def origin_destination(origin, destination)
    [
      distances.where(origin: origin, destination: destination).to_a,
      distances.where(origin: destination, destination: origin).to_a
    ].flatten
  end
end
