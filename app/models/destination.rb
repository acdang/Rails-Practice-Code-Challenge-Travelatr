class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    # returns the 5 most recent posts written about a destination
    def five_most_recent_posts
        self.posts.order("created_at").last(5)
    end

    # returns a destination's post with the most likes
    def featured_post
        self.posts.max_by { |post| post.likes }
    end

    #returns average age of all unique bloggers who have written about this destination
    def bloggers_avg_age
        bloggers_ages = self.bloggers.uniq.map { |blogger| blogger.age }
        bloggers_ages.inject{ |sum, el| sum + el }.to_f / bloggers_ages.size
    end
end
