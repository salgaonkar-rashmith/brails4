class Invitation
  include Mongoid::Document

  field :name, type: String
  field :email, type: String
  field :address, type: String
  field :phone_number, type: String
  field :text, type: String

  embedded_in :user

  validates :name, :email, presence: true
  validates_format_of :email, with: Devise.email_regexp, message: "Invalid email format" 
end