module Api
  module Controllers
    module RegisterCost
      class Create
        include Api::Action

        def call(params)
          origin, destination, distance = parse_values
          saved_result = save_values(origin, destination, distance)
          status 200, { message: 'Distance created with success!' }.to_json
        end

        private

        def save_values(origin, destination, dist)
          distance = DistanceRepository.new
          distance.create(origin: origin, destination: destination, distance: dist)
        end

        def parse_values
          params[:values].split(" ")
        end
      end
    end
  end
end
