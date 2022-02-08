class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birth_day
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                         message: 'は、全角（漢字・ひらがな・カタカナ）で入力してください' } do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/,
                         message: 'は、全角カタカナで入力してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
