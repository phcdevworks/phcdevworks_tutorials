module PhcdevworksTutorials
  class Tutorial::Post < ApplicationRecord
  
    # Clean URL Initialize
    extend FriendlyId

    # Paper Trail Initialize
    has_paper_trail :class_name => 'PhcdevworksTutorials::TutorialPostVersions'

    # Image Upload
    has_one_attached :tutorial_post_image

    # Relationships
    belongs_to :user, class_name: "PhcdevworksAccounts::User"
    belongs_to :optimization, class_name: "PhcdevworksCoreModules::Marketing::Optimization", optional: true
    has_and_belongs_to_many :categories, class_name: "PhcdevworksCoreModules::Post::Category", :join_table => "phcdevworks_tutorials_tutorial_categories_posts", :dependent => :destroy
    has_many :steps, class_name: "Tutorial::Step", :dependent => :destroy

    # Form Fields Validation
    validates :tutorial_post_title,
      presence: true

    validates :tutorial_post_text,
      presence: true

    # Clean URL Define
    friendly_id :tutorial_post_nice_urls, use: [:slugged, :finders]

    def tutorial_post_nice_urls
      [:tutorial_post_title]
    end

  end
end
