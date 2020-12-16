class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true #guest_login
  def self.guest
    find_or_create_by!(email: 'test@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now # Confirmable を使用している場合は必要
    end
  end

  def self.search(search)
    return all unless search

    where(['name LIKE ?', "%#{search}%"])
  end
end
