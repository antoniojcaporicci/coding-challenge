class Post < ApplicationRecord
	has_many :comments, dependent: :destroy

	def self.search(search)
		where("title LIKE ?", "%#{search}%") 
		where("body LIKE ?", "%#{search}%")
  end
end
