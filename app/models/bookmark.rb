class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates_uniqueness_of :post_id, scope: :customer_id
  validates :customer_id, uniqueness: { scope: :post_id}
  # 一つのユーザーは同じ投稿に対して一回しかブックマークができませんというバリデーション

end
