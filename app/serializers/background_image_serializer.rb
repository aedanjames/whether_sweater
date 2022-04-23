class BackgroundImageSerializer
  def self.image(image, location)
    { "data":
      {
        "id": nil,
        "type": 'image',
        "attributes":
        {
          "image":
          {
            "location": location,
            "image_url": image[:photos][0][:url]
          },
          "credit":
          {
            "source": image[:photos][0][:photographer_url],
            "author": image[:photos][0][:photographer],
            "logo": image[:photos][0][:src][:tiny]
          }
        }
      }
    }
  end
end