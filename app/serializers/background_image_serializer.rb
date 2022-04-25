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
            "image_url": image.image_url
          },
          "credit":
          {
            "source": image.source,
            "author": image.author,
            "logo": image.logo
          }
        }
      }
    }
  end
end