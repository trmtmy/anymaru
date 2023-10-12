class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_posts, through: :bookmarks, source: :post
          # ↑名称自由(分かりやすく)ブックマークを通ってポストを参照する
          # カスタマーがブックマークしたポストを持ってこれる
  has_many :comments, dependent: :destroy

  def customer_status
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @cusutomer = Customer.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @cusutomer = Customer.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @cusutomer = Customer.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @cusutomer = Customer.where("name LIKE?","%#{word}%")
    else
      @cusutomer = Customer.all
    end
  end


  has_one_attached :image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

    # 退会済みのユーザーが同じアカウントでログイン出来ないよう制約
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
