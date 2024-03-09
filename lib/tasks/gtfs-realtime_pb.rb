# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: gtfs-realtime.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("gtfs-realtime.proto", :syntax => :proto2) do
    add_message "FeedMessage" do
      required :header, :message, 1, "FeedHeader"
      repeated :entity, :message, 2, "FeedEntity"
    end
    add_message "FeedHeader" do
      required :gtfs_realtime_version, :string, 1
      optional :incrementality, :enum, 2, "FeedHeader.Incrementality", default: 0
      optional :timestamp, :uint64, 3
    end
    add_enum "FeedHeader.Incrementality" do
      value :FULL_DATASET, 0
      value :DIFFERENTIAL, 1
    end
    add_message "FeedEntity" do
      required :id, :string, 1
      optional :is_deleted, :bool, 2, default: false
      optional :trip_update, :message, 3, "TripUpdate"
      optional :vehicle, :message, 4, "VehiclePosition"
      optional :alert, :message, 5, "Alert"
      optional :shape, :message, 6, "Shape"
    end
    add_message "TripUpdate" do
      required :trip, :message, 1, "TripDescriptor"
      optional :vehicle, :message, 3, "VehicleDescriptor"
      repeated :stop_time_update, :message, 2, "TripUpdate.StopTimeUpdate"
      optional :timestamp, :uint64, 4
      optional :delay, :int32, 5
      optional :trip_properties, :message, 6, "TripUpdate.TripProperties"
    end
    add_message "TripUpdate.StopTimeEvent" do
      optional :delay, :int32, 1
      optional :time, :int64, 2
      optional :uncertainty, :int32, 3
    end
    add_message "TripUpdate.StopTimeUpdate" do
      optional :stop_sequence, :uint32, 1
      optional :stop_id, :string, 4
      optional :arrival, :message, 2, "TripUpdate.StopTimeEvent"
      optional :departure, :message, 3, "TripUpdate.StopTimeEvent"
      optional :departure_occupancy_status, :enum, 7, "VehiclePosition.OccupancyStatus"
      optional :schedule_relationship, :enum, 5, "TripUpdate.StopTimeUpdate.ScheduleRelationship", default: 0
      optional :stop_time_properties, :message, 6, "TripUpdate.StopTimeUpdate.StopTimeProperties"
    end
    add_message "TripUpdate.StopTimeUpdate.StopTimeProperties" do
      optional :assigned_stop_id, :string, 1
    end
    add_enum "TripUpdate.StopTimeUpdate.ScheduleRelationship" do
      value :SCHEDULED, 0
      value :SKIPPED, 1
      value :NO_DATA, 2
      value :UNSCHEDULED, 3
    end
    add_message "TripUpdate.TripProperties" do
      optional :trip_id, :string, 1
      optional :start_date, :string, 2
      optional :start_time, :string, 3
      optional :shape_id, :string, 4
    end
    add_message "VehiclePosition" do
      optional :trip, :message, 1, "TripDescriptor"
      optional :vehicle, :message, 8, "VehicleDescriptor"
      optional :position, :message, 2, "Position"
      optional :current_stop_sequence, :uint32, 3
      optional :stop_id, :string, 7
      optional :current_status, :enum, 4, "VehiclePosition.VehicleStopStatus", default: 2
      optional :timestamp, :uint64, 5
      optional :congestion_level, :enum, 6, "VehiclePosition.CongestionLevel"
      optional :occupancy_status, :enum, 9, "VehiclePosition.OccupancyStatus"
      optional :occupancy_percentage, :uint32, 10
      repeated :multi_carriage_details, :message, 11, "VehiclePosition.CarriageDetails"
    end
    add_message "VehiclePosition.CarriageDetails" do
      optional :id, :string, 1
      optional :label, :string, 2
      optional :occupancy_status, :enum, 3, "VehiclePosition.OccupancyStatus", default: 7
      optional :occupancy_percentage, :int32, 4, default: -1
      optional :carriage_sequence, :uint32, 5
    end
    add_enum "VehiclePosition.VehicleStopStatus" do
      value :INCOMING_AT, 0
      value :STOPPED_AT, 1
      value :IN_TRANSIT_TO, 2
    end
    add_enum "VehiclePosition.CongestionLevel" do
      value :UNKNOWN_CONGESTION_LEVEL, 0
      value :RUNNING_SMOOTHLY, 1
      value :STOP_AND_GO, 2
      value :CONGESTION, 3
      value :SEVERE_CONGESTION, 4
    end
    add_enum "VehiclePosition.OccupancyStatus" do
      value :EMPTY, 0
      value :MANY_SEATS_AVAILABLE, 1
      value :FEW_SEATS_AVAILABLE, 2
      value :STANDING_ROOM_ONLY, 3
      value :CRUSHED_STANDING_ROOM_ONLY, 4
      value :FULL, 5
      value :NOT_ACCEPTING_PASSENGERS, 6
      value :NO_DATA_AVAILABLE, 7
      value :NOT_BOARDABLE, 8
    end
    add_message "Alert" do
      repeated :active_period, :message, 1, "TimeRange"
      repeated :informed_entity, :message, 5, "EntitySelector"
      optional :cause, :enum, 6, "Alert.Cause", default: 1
      optional :effect, :enum, 7, "Alert.Effect", default: 8
      optional :url, :message, 8, "TranslatedString"
      optional :header_text, :message, 10, "TranslatedString"
      optional :description_text, :message, 11, "TranslatedString"
      optional :tts_header_text, :message, 12, "TranslatedString"
      optional :tts_description_text, :message, 13, "TranslatedString"
      optional :severity_level, :enum, 14, "Alert.SeverityLevel", default: 1
      optional :image, :message, 15, "TranslatedImage"
      optional :image_alternative_text, :message, 16, "TranslatedString"
      optional :cause_detail, :message, 17, "TranslatedString"
      optional :effect_detail, :message, 18, "TranslatedString"
    end
    add_enum "Alert.Cause" do
      value :UNKNOWN_CAUSE, 1
      value :OTHER_CAUSE, 2
      value :TECHNICAL_PROBLEM, 3
      value :STRIKE, 4
      value :DEMONSTRATION, 5
      value :ACCIDENT, 6
      value :HOLIDAY, 7
      value :WEATHER, 8
      value :MAINTENANCE, 9
      value :CONSTRUCTION, 10
      value :POLICE_ACTIVITY, 11
      value :MEDICAL_EMERGENCY, 12
    end
    add_enum "Alert.Effect" do
      value :NO_SERVICE, 1
      value :REDUCED_SERVICE, 2
      value :SIGNIFICANT_DELAYS, 3
      value :DETOUR, 4
      value :ADDITIONAL_SERVICE, 5
      value :MODIFIED_SERVICE, 6
      value :OTHER_EFFECT, 7
      value :UNKNOWN_EFFECT, 8
      value :STOP_MOVED, 9
      value :NO_EFFECT, 10
      value :ACCESSIBILITY_ISSUE, 11
    end
    add_enum "Alert.SeverityLevel" do
      value :UNKNOWN_SEVERITY, 1
      value :INFO, 2
      value :WARNING, 3
      value :SEVERE, 4
    end
    add_message "TimeRange" do
      optional :start, :uint64, 1
      optional :end, :uint64, 2
    end
    add_message "Position" do
      required :latitude, :float, 1
      required :longitude, :float, 2
      optional :bearing, :float, 3
      optional :odometer, :double, 4
      optional :speed, :float, 5
    end
    add_message "TripDescriptor" do
      optional :trip_id, :string, 1
      optional :route_id, :string, 5
      optional :direction_id, :uint32, 6
      optional :start_time, :string, 2
      optional :start_date, :string, 3
      optional :schedule_relationship, :enum, 4, "TripDescriptor.ScheduleRelationship"
    end
    add_enum "TripDescriptor.ScheduleRelationship" do
      value :SCHEDULED, 0
      value :ADDED, 1
      value :UNSCHEDULED, 2
      value :CANCELED, 3
      value :REPLACEMENT, 5
      value :DUPLICATED, 6
      value :DELETED, 7
    end
    add_message "VehicleDescriptor" do
      optional :id, :string, 1
      optional :label, :string, 2
      optional :license_plate, :string, 3
      optional :wheelchair_accessible, :enum, 4, "VehicleDescriptor.WheelchairAccessible", default: 0
    end
    add_enum "VehicleDescriptor.WheelchairAccessible" do
      value :NO_VALUE, 0
      value :UNKNOWN, 1
      value :WHEELCHAIR_ACCESSIBLE, 2
      value :WHEELCHAIR_INACCESSIBLE, 3
    end
    add_message "EntitySelector" do
      optional :agency_id, :string, 1
      optional :route_id, :string, 2
      optional :route_type, :int32, 3
      optional :trip, :message, 4, "TripDescriptor"
      optional :stop_id, :string, 5
      optional :direction_id, :uint32, 6
    end
    add_message "TranslatedString" do
      repeated :translation, :message, 1, "TranslatedString.Translation"
    end
    add_message "TranslatedString.Translation" do
      required :text, :string, 1
      optional :language, :string, 2
    end
    add_message "TranslatedImage" do
      repeated :localized_image, :message, 1, "TranslatedImage.LocalizedImage"
    end
    add_message "TranslatedImage.LocalizedImage" do
      required :url, :string, 1
      required :media_type, :string, 2
      optional :language, :string, 3
    end
    add_message "Shape" do
      optional :shape_id, :string, 1
      optional :encoded_polyline, :string, 2
    end
  end
end

FeedMessage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FeedMessage").msgclass
FeedHeader = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FeedHeader").msgclass
FeedHeader::Incrementality = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FeedHeader.Incrementality").enummodule
FeedEntity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("FeedEntity").msgclass
TripUpdate = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripUpdate").msgclass
TripUpdate::StopTimeEvent = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripUpdate.StopTimeEvent").msgclass
TripUpdate::StopTimeUpdate = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripUpdate.StopTimeUpdate").msgclass
TripUpdate::StopTimeUpdate::StopTimeProperties = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripUpdate.StopTimeUpdate.StopTimeProperties").msgclass
TripUpdate::StopTimeUpdate::ScheduleRelationship = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripUpdate.StopTimeUpdate.ScheduleRelationship").enummodule
TripUpdate::TripProperties = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripUpdate.TripProperties").msgclass
VehiclePosition = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehiclePosition").msgclass
VehiclePosition::CarriageDetails = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehiclePosition.CarriageDetails").msgclass
VehiclePosition::VehicleStopStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehiclePosition.VehicleStopStatus").enummodule
VehiclePosition::CongestionLevel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehiclePosition.CongestionLevel").enummodule
VehiclePosition::OccupancyStatus = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehiclePosition.OccupancyStatus").enummodule
Alert = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Alert").msgclass
Alert::Cause = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Alert.Cause").enummodule
Alert::Effect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Alert.Effect").enummodule
Alert::SeverityLevel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Alert.SeverityLevel").enummodule
TimeRange = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TimeRange").msgclass
Position = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Position").msgclass
TripDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripDescriptor").msgclass
TripDescriptor::ScheduleRelationship = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TripDescriptor.ScheduleRelationship").enummodule
VehicleDescriptor = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehicleDescriptor").msgclass
VehicleDescriptor::WheelchairAccessible = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("VehicleDescriptor.WheelchairAccessible").enummodule
EntitySelector = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("EntitySelector").msgclass
TranslatedString = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TranslatedString").msgclass
TranslatedString::Translation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TranslatedString.Translation").msgclass
TranslatedImage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TranslatedImage").msgclass
TranslatedImage::LocalizedImage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("TranslatedImage.LocalizedImage").msgclass
Shape = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("Shape").msgclass
