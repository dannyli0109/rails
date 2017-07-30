class PagesController < ApplicationController
  def index

  end

  def about

  end

  def form


  end


  def result
    json = params[:results]

    @body = []




    if json["farm.hgpTreated"] == "false" && json["farm.hgpOnProperty"] == "false" && json["farm.NLIS"] == "true"
      @body.push("Great! It looks like you are ready to apply to become an accredited farm.")
    else
      if json["farm.hgpTreated"] == "true"
        @body.push("You will need to remove all cattle treated with HGPs (Hormone Growth Promotants) from your property. A Statutory Declaration recording removal of treated cattle will be required with your application.")
      end

      if json["farm.hgpOnProperty"] == "true"
        @body.push("You will need to remove the HGPs (Hormone Growth Promotants) on your property. A Statutory Declaration recording the removal of unused HGP doses will be required with your application.")
      end

      if json["farm.NLIS"] == "false"
        @body.push("All the cattle on your property must be identified with an NLIS (National Livestock Identification System) device.")
      end
    end

    @body.push("You can get the application form for accreditation from the Department of Agriculture, Forestry and Fishing from their website at http://www.agriculture.gov.au/biosecurity/eucas or by contacting the EUCAS helpline on 1800 305 544. You must submit the application form to the department with the appropriate attachments. Thank you.")

  end

  def chat


  end


  def dashboard

  end



  def sourcecode

  end

end
