module Api
  module Controllers
    module RegisterCost
      class Create
        include Api::Action

        def call(params)
          origin, destination, distance = parse_values
          saved_result = save_values(origin, destination, distance)
          if saved_result
            status 200, { message: 'Distance created with success!' }.to_json
          else
            status 400, { message: 'Error on create or update distance!' }.to_json
          end
        end

        private

        def save_values(origin, destination, dist)
          distance = DistanceRepository.new
          records = distance.origin_destination(origin, destination)
          begin
            if records.any?
              distance.update(records[0].id, distance: dist)
            else
              distance.create(origin: origin, destination: destination, distance: dist)
            end
          rescue Exception => e
            return false
          end

          return true
        end

        def parse_values
          request.body.read.split(" ")
        end
      end
    end
  end
end
