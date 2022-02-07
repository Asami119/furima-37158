class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :postage, :prefecture, :days_post

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :days_post_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :prefecture_id
    validates :days_post_id
  end

  validates :price, numericality: { only_integer: true, message: 'は半角数値のみ設定可能です' }
  validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, message: 'は、¥300~¥9,999,999の間で設定してください' }

end
