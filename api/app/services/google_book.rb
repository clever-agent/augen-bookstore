require 'net/http'
require 'json'

class GoogleBook
    def self.search text
        response = Net::HTTP.get(URI.parse('https://www.googleapis.com/books/v1/volumes?q=' + text))
        result = JSON.parse(response)

        return result["items"].nil? ? [] : result["items"]
    end
end