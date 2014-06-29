# == Schema Information
#
# Table name: contacts
#
#  id               :integer          not null, primary key
#  contactable_id   :integer
#  contactable_type :string(255)
#  email            :string(255)
#  phone            :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Contact < ActiveRecord::Base
  belongs_to :contactable, polymorphic: true
  validates :email, email: true
  validate :email_or_phone_present

  private
    def email_or_phone_present
      if !(email.present? || phone.present?)
        errors[:base] << "Enter E-mail or phone number"
      end
    end
end
