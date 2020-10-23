class Url < ApplicationRecord
  validates :full, format: URI::regexp(%w[http https])
  validates_length_of :full, within: 3..1023, on: :create, message: "too long"

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
