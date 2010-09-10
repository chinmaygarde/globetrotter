class JourneyQuest < ActiveRecord::Base
  belongs_to :quest
  belongs_to :journey
end
