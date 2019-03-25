class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  private
    def clickbait?
      clickbait = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [\d]*/i]
      clickbait.none? { |bait| value.match(bait) }
    end
end
