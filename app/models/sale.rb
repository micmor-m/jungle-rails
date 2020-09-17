class Sale < ActiveRecord::Base

  #Class dfinition active
  #Active Record Scope
  #this is equivalent at        scope :active, --> { | }
  def self.active
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
