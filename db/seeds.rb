# 管理者
Admin.find_or_create_by!(email: 'admin@admin') do |admin|
  admin.password = '111111'
end

# ユーザーデータ

shiro = Customer.find_or_create_by!(email: "shiro@example.com") do |customer|
  customer.name = "shiro"
  customer.profile = "以前猫を飼っていました。また猫をお迎えしたいと思っています。よろしくお願いします。"
  customer.area = "関東"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shiro.jpeg"), filename:"shiro.jpeg")
end

kuro = Customer.find_or_create_by!(email: "kuro@example.com") do |customer|
  customer.name = "kuro"
  customer.profile = "愛犬のボストンテリアがいなくなってしまいました。女の子で、赤のチェック模様の首輪をしています。情報を探しています。"
  customer.area = "四国"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kuro.jpeg"), filename:"kuro.jpeg")
end

kaya = Customer.find_or_create_by!(email: "kaya@example.com") do |customer|
  customer.name = "kaya"
  customer.profile = "現在柴犬と思われる犬を見つけ保護しております。様子を投稿して行こうと思います。"
  customer.area = "関東"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/kaya.jpeg"), filename:"kaya.jpeg")
end

mm = Customer.find_or_create_by!(email: "mm@example.com") do |customer|
  customer.name = "mm"
  customer.profile = "新しい家族を探しています。大型犬をお迎えしてみたいです。"
  customer.area = "埼玉"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/mm.jpg"), filename:"mm.jpg")
end

tw = Customer.find_or_create_by!(email: "tw@example.com") do |customer|
  customer.name = "tw"
  customer.profile = "いなくなってしまったゴールデンレトリバーの男の子を探しています。細身で食べることが好きで賢い子です。"
  customer.area = "埼玉"
  customer.password = "password"
  customer.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/tw.jpg"), filename:"tw.jpg")
end



# 投稿データ

Post.find_or_create_by!(category: "welcome") do |post|
  post.post_images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post.shiro.jpeg"), filename:"post.shiro.jpeg")
  post.introduction = "交渉の結果トライアルをさせていただくことが出来ました！よく食べよく眠る可愛い子です！"
  post.category = 1
  post.customer = shiro
end

Post.find_or_create_by!(category: "searching") do |post|
  post.post_images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post.kuro.jpeg"), filename:"post.kuro.jpeg")
  post.introduction = "ボストンテリアの女の子「りん」を探しています。細身のおばあちゃん犬です。目撃情報等なんでも構いませんので情報を探しております。"
  post.category = 0
  post.customer = kuro
end

Post.find_or_create_by!(category: "protection") do |post|
  post.post_images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post.kaya.jpeg"), filename:"post.kaya.jpeg")
  post.introduction = "柴犬と思われる男の子を保護しました。外が好きなようなので、散歩中に飼い主さんとはぐれてしまったのかもしれません。警察に報告後我が家で保護しておりますので、飼い主さんからのご連絡をお待ちしております。"
  post.category = 2
  post.customer = kaya
end

Post.find_or_create_by!(category: "others") do |post|
  post.post_images = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post.mm.jpg"), filename:"post.mm.jpg")
  post.introduction = "こちらでゴールデンレトリバーをお迎えしました！賢くて可愛らしい男の子です。"
  post.category = 3
  post.customer = mm
end

Post.find_or_create_by!(introduction: "そら") do |post|
  post.post_images = [ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post.tw.jpg"), filename:"post.tw.jpg"), ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/post.tw2.jpg"), filename:"post.tw2.jpg")]

  post.introduction = "ゴールデンレトリバーの男の子「そら」を探しています。活動的で細身、食べることが好きで、おすわりや待てなど基本的なことは出来ます。噛み癖はなく、人を怖がりません。なんでも良いので情報をください。"
  post.category = 0
  post.customer = tw
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
