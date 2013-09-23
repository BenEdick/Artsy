class Artist < ActiveRecord::Base
  has_one :art, dependent: :destroy
  accepts_nested_attributes_for :art

  def name
    [first_name, last_name].join(' ')
  end

  def age
    today = Date.today
    age = today.year - dob.year
    age -= 1 if dob.strftime("%m%d").to_i > today.strftime("%m%d").to_i
    age
  end

end
