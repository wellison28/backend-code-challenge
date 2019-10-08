module Api
  module Controllers
    module Calculator
      class Cost
        include Api::Action

        def call(params)
          distance = get_lowest_path

          if distance.nil?
            self.status = 404
            self.body = "Path not exists!" 
          else
            self.status = 201
            self.body = calculate_cost(distance) 
          end
        end

        private

        def calculate_cost(distance)
          (distance * 0.15 * params[:weight].to_i).to_s
        end

        def get_lowest_path
          distances = DistanceRepository.new.all.to_a
          graph = Service::Graph.new
          distances.each do |distance|
            graph << distance.origin unless graph.include?(distance.origin)
            graph << distance.destination unless graph.include?(distance.destination)
            graph.connect_mutually(distance.origin, distance.destination, distance.distance)
          end

          graph.dijkstra(params[:origin], params[:destination])
        end
      end
    end
  end
end
