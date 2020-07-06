class Book < ApplicationRecord
	belongs_to :user
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true, length: {maximum: 200}
	validates :body, presence: true, length: {maximum: 200}
end
