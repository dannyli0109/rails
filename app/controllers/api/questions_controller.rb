class Api::QuestionsController < ApplicationController

  def finance_show

    request = Typhoeus::Request.new(
    "https://raap.d61.io/api/v0/domain/export-control/reasoning/goals",
    headers: { 'Content-Type' => "application/json", "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMGQ3YmYwZS1mODhiLTQwZTktOTRjNS05MTU4OGIxNTJmMGYiLCJleHAiOjE1MDM3MDg5NDIsImlhdCI6MTUwMTI4OTc0Mn0.Z-uGwCZbNuFGWe-SLSru1C08fsFlEhUyMavHtqUlzQA" },
    body: {

      })

      json = {}

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





    def escalator_show
      request = Typhoeus::Request.new(
      "https://raap.d61.io/api/v0/domain/export-control/schema",
      headers: { 'Content-Type' => "application/json", "Authorization" => "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlMGQ3YmYwZS1mODhiLTQwZTktOTRjNS05MTU4OGIxNTJmMGYiLCJleHAiOjE1MDM3MDg5NDIsImlhdCI6MTUwMTI4OTc0Mn0.Z-uGwCZbNuFGWe-SLSru1C08fsFlEhUyMavHtqUlzQA" },
      body: {

        })

        json = []

        questions = {
          "building.isHealthCareFacility" => "Is the building a health care facility?",
          "building.isResidential" => "Is the building residential?",
          "escalator.additionalSafetyInspectionPassed" => "Is the escalator passes the addtional safety inspection?",
          "escalator.dateOfLastService" => "What is the date of the last service on the escalator?",
          "escalator.dateOfManufacture" => "What date was the escalator manufactured?",
          "escalator.eachStoreyConnectedHasSprinkler" => "Are each of the storey connected has a sprinkler?",
          "escalator.location.carpark" => "Does the location of the escalator has a carpark?",
          "escalator.location.openSpectatorStand" => "Does the location of the escalator has open spectator stand?",
          "escalator.maxAllowedNumStoreys" => "What is the maximum allowed number of Storeys?",
          "escalator.mechanicallySound" => "Is the escalator mechanically sound?",
          "escalator.numberOfStoreysConnected" => "What is the number of storerys connected?",
          "escalator.operation" => "Is the escalator operational?",
          "todayDate" => "What date is it today?"
        }

        return_json = []


        request.on_complete do |response|


          if response.success?
            json = JSON.parse(response.body)

            json.each do |question|
              return_question = question
              if question["description"] == ""
                return_question["description"] = questions[return_question["name"]]
              end

              return_json.push(return_question)

              puts question



            end
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
