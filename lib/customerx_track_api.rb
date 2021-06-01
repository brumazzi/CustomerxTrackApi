require 'rubygems'
require 'active_model'

require 'customerx_track_api/version'
require 'customerx_track_api/configure'
require 'customerx_track_api/request'

class CustomerxTrackApi
    extend CustomerxTrackApi::Configure

    def list()
        CustomerxTrackApi::Request.build_request()
    end

    def show(mapping_id)
        CustomerxTrackApi::Request.build_request("#{mapping_id}")
    end

    def create(type_tracking, identifier, description)
        body = {
            type_tracking: type_tracking,
            identifier: identifier,
            description: description,
        }
        CustomerxTrackApi::Request.build_request('', :post, body)
    end

    def update(mapping_id)
        CustomerxTrackApi::Request.build_request("#{mapping_id}/change_use_playbook", :put, {use_playbook: true})
    end

    def delete(mapping_id)
        CustomerxTrackApi::Request.build_request("#{mapping_id}", :delete)
    end
end