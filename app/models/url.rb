require 'uri'
class Url < ActiveRecord::Base
  validate :is_a_url

  private
  def is_a_url
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
  rescue URI::InvalidURIError
    errors.add(:url, 'The text you entered is not a valid URL')
  end
end