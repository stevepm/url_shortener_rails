require 'uri'
class Url < ActiveRecord::Base
  validates :url, :presence => {:message => 'URL can not be blank'}
  validate :is_a_url

  private
  def is_a_url
    if url.split(' ').count > 1
      errors.add(:url, 'The text you entered is not a valid URL')
    end
    uri = URI.parse(url)
    if !uri.kind_of?(URI::HTTP)
      errors.add(:url, 'The text you entered is not a valid URL')
    end
  rescue URI::InvalidURIError

  end
end