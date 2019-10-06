module Api
  module Controllers
    module RegisterCost
      class Create
        include Api::Action

        def call(params)
          status 200, { message: 'Hello from Hanami!' }.to_json
        end
      end
    end
  end
end
