class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true, presence: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 31 }

    # returns total number of likes on all of a blogger's posts
    def total_likes
        # access all of blogger's posts
        # get all those posts' likes
        # add up those likes
        self.posts.map { |post| post.likes }.sum
    end

    # returns a blogger's post with the most likes
    def featured_post
        # access all of blogger's posts
        # compare likes to get the max
        self.posts.max_by { |post| post.likes }
    end
end
