require 'nokogiri'
require 'rest_client'

module WebServices
  module MerriamWebster
    PAGE_URL = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml"

    def self.get_definitions(word)
      response = RestClient.get("#{PAGE_URL}/#{word}",
                                {params: {key: Rails.application.secrets.merriam_webster_key}})

      case response.code
        when 200..299
          data = Nokogiri::XML(response)

          definitions = data.xpath("//dt/child::text()")
            .map { |el| el.text.gsub(':', '') }
            .reject { |el| el.blank? }

          definitions.any? ? definitions : ["Definition not found"]
        else
          ["An error has occurred. Please try again later"]
      end
    end
  end
end
