class PostageType < ActiveHash::Base

  self.data = [
    {id: 1, name: 'ヤマト宅急便'}, {id: 2, name: 'ゆうパック'}, {id: 3, name: 'ヤマト便'},
    {id: 4, name: '飛脚宅配便'}
  ]

  include ActiveHash::Associations
  has_many :items

end
