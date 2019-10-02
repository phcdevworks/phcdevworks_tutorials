module PhcdevworksTutorials
  class Tutorial::Step < ApplicationRecord

    # Image Upload
    has_one_attached :tutorial_step_images

    # Relationships
    belongs_to :post, class_name: "PhcdevworksTutorials::Tutorial::Post"

  end
end