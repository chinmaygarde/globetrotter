class Checkpoint < ActiveRecord::Base
  belongs_to :user
  validates_numericality_of :latitude, :longitude
  after_create :add_journey_and_update_quests, :reverse_geocode
  acts_as_mappable :default_units => :kms, :lat_column_name => :latitude, :lng_column_name => :longitude
  
  private
  def add_journey_and_update_quests
    checkpoints = user.checkpoints.order("created_at DESC").limit(2)
    if checkpoints.length == 2
      journey = user.journeys.build
      journey.from_checkpoint = checkpoints[1]
      journey.to_checkpoint = checkpoints[0]
      journey.save
      
      user.quests_as_member.each do |quest_as_member|
        quest_as_member.journeys << journey
      end
      
      user.quests.each do |quest|
        quest.journeys << journey
      end
    end
  end
  
  def reverse_geocode
    # TODO: Add to background queue
    result = Geokit::Geocoders::MultiGeocoder.reverse_geocode([latitude, longitude])
    if result.success
      self.address = result.full_address
    else
      self.address = "#{latitude}, #{longitude}"
    end
    self.save
  end
end
