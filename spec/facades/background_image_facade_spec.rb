require 'rails_helper'
RSpec.describe 'BackgroundImageFacade' do
 it ".find_image", :vcr do
   image = BackgroundImageFacade.find_image("Denver")

  expect(image.image_url).to be_a String
  expect(image.author).to be_a String
  expect(image.logo).to be_a String
  expect(image.source).to be_a String
  end
end