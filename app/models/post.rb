class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates :title, presence: true
    validates :content, length: { minimum: 101 }

    # return content into Ruby array
    def content_parse
        JSON.parse(self.content)
    end
end
