module CustomerxTrackApi
    class Configure
        URL = {
            :sandbox             => "https://sandbox.tracking.customerx.com.br/api/",
            :production          => "https://tracking.customerx.com.br/api/",
        }

        attr_writer :environment
        attr_writer :api_version
        attr_writer :access_key
        attr_writer :credential

        def initialize(environment=:sandbox, api_version='v1', access_key='', credential='')
            @environment = environment
            @api_version = api_version
            @access_key = access_key
            @credential = credential
        end

        def environment(type=nil)
            return @environment if type.nil?
            @environment = type
        end

        def api_version
            return @api_version if type.nil?
            @api_version = type
        end

        def access_key
            return @access_key if type.nil?
            @access_key = type
        end

        def credential
            return @credential if type.nil?
            @credential = type
        end

        def endpoint
            @endpoint ||= set_endpoint
        end

        def access_token
            @access_token ||= ""
        end

        def set_endpoint
            if environment == :production
                return GetnetApi::Configure::URL[:production]
            else
                return GetnetApi::Configure::URL[:sandbox]
            end
        end

        def base_uri
            return "#{self.endpoint}/#{self.api_version}/mappings"
        end
    end
end