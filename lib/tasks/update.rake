require "open-uri"
require 'google/protobuf'
require_relative 'gtfs-realtime_pb.rb'

namespace :update_transit do
  desc "Fetch transit data"
  task update: :environment do
    #clear db, get data from gcrta and add to db
    URI.open("https://gtfs-rt.gcrta.vontascloud.com/TMGTFSRealTimeWebService/Vehicle/VehiclePositions.pb") do |file|
      #drop and recreate table
      #ActiveRecord::Migration.drop_table(:transits)
      #ActiveRecord::Migration.create_table(:transits)
      Transit.delete_all
      #read the data from the url
      readfile = file.read

      #read it as a protobuf
      data = FeedMessage.decode(readfile)
      #convert it to hash
      datahash = data.to_h
      #parse and store it (66 and 67 are the rail routes)
      datahash[:entity].each do |entry|
        if entry[:vehicle][:trip][:route_id] == "66" || entry[:vehicle][:trip][:route_id] == "67"
          #create db entry
          #print "Accepted: tripid: #{entry[:vehicle][:trip][:trip_id]}, routeid: #{entry[:vehicle][:trip][:route_id].to_i}\n"
          Transit.create(tripid: entry[:vehicle][:trip][:trip_id], routeid: entry[:vehicle][:trip][:route_id].to_i, lat: entry[:vehicle][:position][:latitude].to_f, long: entry[:vehicle][:position][:longitude].to_f, bearing: entry[:vehicle][:position][:bearing].to_f)
        #else
        #  print "Rejected: tripid: #{entry[:vehicle][:trip][:trip_id]}, routeid: #{entry[:vehicle][:trip][:route_id].to_i}\n"
        end
      end
    end
  end
end