class Post < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_customers, through: :bookmarks, source: :customer
          # ↑名称自由(分かりやすく)ブックマークを通ってカスタマーを参照する
          # ポストをブックマークしたカスタマーを持ってこれる
  validates :introduction,presence:true
  validates :category, presence: true

  has_many_attached :post_images

  def get_post_images
    unless post_images.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      post_images.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_images
  end

  # ブクマしているかどうか
  def bookmark_by?(customer)
    bookmarks.where(customer_id: customer.id).exists?
  end

  enum category: { searching: 0, welcome: 1, protection: 2, others: 3 }

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("introduction LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("introduction LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("introduction LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("introduction LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
end
