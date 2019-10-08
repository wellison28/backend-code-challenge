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
          records = distance.origin_destination(origin, destination)
          if records.any?
            distance.update(records[0].id, distance: dist)
          else
            distance.create(origin: origin, destination: destination, distance: dist)
          end
        end

        def parse_values
          request.body.read.split(" ")
        end
      end
    end
  end
end
