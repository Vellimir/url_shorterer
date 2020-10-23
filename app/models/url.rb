class Url < ApplicationRecord

  def self.build(full_url)
    short = SecureRandom.uuid[0..5]
    Url.create(full: full_url, short: short)
  end

  def resolve
    self.count += 1
    self.save
    self.full
  end

end
