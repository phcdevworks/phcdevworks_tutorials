module PhcdevworksTutorials
  class Tutorial::Post < ApplicationRecord
  
    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::TutorialPostVersions'

    # Image Upload
    has_one_attached :post_image

    # Relationships
    has_and_belongs_to_many :categories, class_name: "Tutorial::Category", :join_table => "phcdevworks_tutorials_categories_posts", :dependent => :destroy
    has_many :steps, class_name: "Tutorial::Step"
    belongs_to :user, class_name: "PhcdevworksAccounts::User"

    # Form Fields Validation
    validates :post_title,
      presence: true

    validates :post_description,
      presence: true

    # Clean URL Define
    friendly_id :phcdev_tutorial_post_nice_urls, use: [:slugged, :finders]

    def phcdev_tutorial_post_nice_urls
      [:post_title]
    end

  end
end
