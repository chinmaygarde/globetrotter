class UserSession < Authlogic::Session::Base
  include ActiveModel::Conversion
  
  def persisted?
    false
  end
  
  def to_key 
    new_record? ? nil : [ self.send(self.class.primary_key) ] 
  end
  
end
