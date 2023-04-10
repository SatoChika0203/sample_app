class List < ApplicationRecord
  has_one_attached :image
  #Listモデルにtitleとbodyに加えて画像を扱うための
  #imageカラムが追記されたかのように扱える

  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true

  #バリテーション...入力チェックの機能を追加して、画像、タイトル、本文が必須入力になるように設定
  #validatesで対象とする項目を指定し、入力されたデータのpresence（存在）をチェックする
  #true...データが存在しなければならないという設定
  #modelを通してデータベースに値を保存するとき、必須項目に入力されているかを確認する

end
