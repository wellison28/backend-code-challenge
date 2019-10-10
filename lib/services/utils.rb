require_relative '../diikstra/graph'

module Service
  def self.save_values(origin, destination, dist)
    record = Distance.where(origin: origin, destination: destination)

    if record.any?
      save = record.first.update(origin: origin, destination: destination, kilometers: dist)
    else
      save = Distance.create(origin: origin, destination: destination, kilometers: dist)
    end

    return true if save
    return false
  end

  def self.parse_values(params)
    [params.split(" ")[0], params.split(" ")[1], params.split(" ")[2].to_i]
  end

  def self.calculate_cost(distance, params)
    (distance * 0.15 * params[:weight].to_i).to_s
  end

  def self.get_lowest_path(params)
    distances = Distance.all
    graph = Diikstra::Graph.new
    distances.each do |distance|
      graph << distance.origin unless graph.include?(distance.origin)
      graph << distance.destination unless graph.include?(distance.destination)
      graph.connect_mutually(distance.origin, distance.destination, distance.kilometers)
    end

    graph.dijkstra(params[:origin], params[:destination])
  end

  def self.valid_params?(params)
    params[:weight].to_i > 0 && params[:weight].to_i <= 50
  end  
end