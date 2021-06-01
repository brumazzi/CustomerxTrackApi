module CustomerxTrackApi
    class Request
        require 'uri'
        require 'net/http'
        require 'json'

        def self.build_request(endpoint='', method=:get, body=nil)
            url = URI("#{CustomerxTrackApi.base_uri}/#{endpoint}")

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true

            request = nil
            case method
            when :get
                request = Net::HTTP::Get.new(url)
            when :post
                request = Net::HTTP::Post.new(url)
            when :put
                request = Net::HTTP::Put.new(url)
            when :delete
                request = Net::HTTP::Delete.new(url)
            end

            request["Content-Type"] = "application/json"
            request["credential"] = CustomerxTrackApi::Configure.credential
            request["key"] = CustomerxTrackApi::Configure.access_key
            request["body"] = JSON.generate(body) unless body.nil?

            http.request(request)
        end
    end
end