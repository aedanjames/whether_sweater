require 'rails_helper'

RSpec.describe User do 
  describe "validations" do 
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_uniqueness_of(:email)}
    it {should have_secure_password}
    it { should have_secure_token(:auth_token) }
  end 
end