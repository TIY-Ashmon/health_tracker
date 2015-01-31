class Joule < ActiveRecord::Base

  def self.calories_entered_today
    js= Joule.where(added_on: Date.today)
    return js.sum(:consumed_joules)
  end
end
