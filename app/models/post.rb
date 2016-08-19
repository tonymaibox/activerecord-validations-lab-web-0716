class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 100 }
	validates :summary, length: { maximum: 20 }
	validates :category, inclusion: { in: %w(Fiction non-fiction)}
	validate :click_bait

	def click_bait
		clickbait = [/Won't believe/i, /top[0..9]*/i, /guess/i, /secret/i]
		errors.add(:title) if !clickbait.any? {|word| word.match title}
	end

end
