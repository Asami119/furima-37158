class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # with_options presence: true do
  #   validates :nickname
  #   validates :last_name
  #   validates :first_name
  #   validates :last_name_kana
  #   validates :first_name_kana
  #   validates :birth_day
  # end


  # validates :encrypted_password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
  #   message: "半角英数字混合での入力が必須です" }

  # with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
  #   message: "全角（漢字・ひらがな・カタカナ）での入力が必須です" } do
  #   validates :last_name
  #   validates :first_name
  # end

  # with_options format: { with: /\A[ぁ-んァ-ヶー]+\z/,
  #   message: "全角（カタカナ）での入力が必須です" } do
  #   validates :last_name
  #   validates :first_name
  # end

end
