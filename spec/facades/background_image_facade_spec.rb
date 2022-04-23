require 'rails_helper'
RSpec.describe 'BackgroundImageFacade' do
 it ".find_image", :vcr do
   image = BackgroundImageFacade.find_image("Denver")

   expect(image[:photos][0]).to have_key(:width)
   expect(image[:photos][0]).to have_key(:height)
   expect(image[:photos][0]).to have_key(:url)
   expect(image[:photos][0]).to have_key(:photographer_url)
   expect(image[:photos][0]).to have_key(:photographer)
   expect(image[:photos][0][:src]).to have_key(:original)
   expect(image[:photos][0][:src]).to have_key(:medium)
   expect(image[:photos][0][:src]).to have_key(:small)
  end
end