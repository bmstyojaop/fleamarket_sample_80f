class Categories < ActiveHash::Base

  self.data = [
      {id: 1, name: '経済'}, {id: 2, name: '経営'}, {id: 3, name: 'スキルアップ'}, {id: 4, name: '金融'},
      {id: 5, name: '職種別'},{id: 6, name: 'ライフスタイル'},{id: 7, name: 'その他'}
  ]


end