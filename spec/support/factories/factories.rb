Factory.define :user do |f|
  f.username              "buzzy"
  f.password              "secret"
  f.password_confirmation {|u| u.password}
  f.email                 "buzzy@awesomeness.com"
  f.quests                { |q| [q.association(:quest)] }
end

Factory.define :checkpoint do |f|
  f.latitude  37.33182
  f.longitude 122.03118
  f.user { |c| c.association(:user) }
end

Factory.define :notification do |f|
  f.message "You have a notification"
  f.user { |n| n.association(:user) }
end

Factory.define :journey do |f|
  f.user { |j| j.association(:user) }
  f.from_checkpoint { |j| j.association(:checkpoint) }
  f.to_checkpoint { |j| j.association(:checkpoint) }
end

Factory.define :quest do |f|
  f.title         "Quest Title"
  f.description   "Quest Description"
  f.quest_master  { |qm| qm.association(:user) }
end
#has_many :checkpoints
#has_many :friendships
#has_many :friends, :through => :friendships
#has_many :journeys
#has_many :quests, :class_name => "Quest", :foreign_key => "quest_master"
#has_many :notifications
#
#has_many :quest_memberships, :class_name => "QuestMembership", :foreign_key => "user_id"
#has_many :quests_as_member, :through => :quest_memberships, :source => :quest
