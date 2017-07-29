class Api::GoalsController < ApplicationController
  def escalator_show
    request = Typhoeus::Request.new(
    "https://raap.d61.io/api/v0/domain/demonstration/reasoning/goals",
    headers: { 'Content-Type' => "application/json", "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMGQ3YmYwZS1mODhiLTQwZTktOTRjNS05MTU4OGIxNTJmMGYiLCJleHAiOjE1MDM3MDg5NDIsImlhdCI6MTUwMTI4OTc0Mn0.Z-uGwCZbNuFGWe-SLSru1C08fsFlEhUyMavHtqUlzQA" },
    body: {

      })

      json = {}


      # questions = {
      #   "building.isHealthCareFacility": "Is the building a health care facility?"
      #   "building"
      # }
      #

      
      request.on_complete do |response|


        if response.success?
          json = JSON.parse(response.body)





          # hell yeah
        elsif response.timed_out?
          # aw hell no
          log("got a time out")
        elsif response.code == 0
          # Could not get an http response, something's wrong.
          log(response.return_message)
        else
          # Received a non-successful http response.
          log("HTTP request failed: " + response.code.to_s)
        end
      end

      request.run

      render json: json
    end



  end
