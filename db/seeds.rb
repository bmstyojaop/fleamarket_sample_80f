# 親
lady = Category.create(name: "レディース")

# 子
lady_tops = lady.children.create(name: "トップス")
lady_jacket = lady.children.create(name: "ジャケット/アウター")
lady_pants = lady.children.create(name: "パンツ")
lady_skirt = lady.children.create(name: "スカート")
lady_onePiece = lady.children.create(name: "ワンピース")
lady_shoes = lady.children.create(name: "靴")
lady_room = lady.children.create(name: "ルームウェア/パジャマ")
lady_leg = lady.children.create(name: "レッグウェア")
lady_cap = lady.children.create(name: "帽子")
lady_bag = lady.children.create(name: "バッグ")
lady_accessory = lady.children.create(name: "アクセサリー")
lady_hairAccessory = lady.children.create(name: "ヘアアクセサリー")
lady_smallArticles = lady.children.create(name: "小物")
lady_watch = lady.children.create(name: "時計")

# 孫

lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ/ブラウス(半袖/袖なし)"}, {name: "シャツ/ブラウス(七分/長袖)"}, {name: "ポロシャツ"}, {name: "キャミソール"}, {name: "タンクトップ"}, {name: "ホルターネック"}, {name: "ニット/セーター"}, {name: "チェニック"}, {name: "カーディガン/ボレロ"}, {name: "アンサンブル"}, {name: "ベスト/ジレ"}, {name: "パーカー"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ミリタリージャケット"}, {name: "ダウンベスト"}, {name: "ジャンパー/ブルゾン"}, {name: "ポンチョ"}, {name: "ロングコート"}, {name: "トレンチコート"}, {name: "ダッフルコート"}, {name: "ピーコート"}])
lady_pants.children.create([{name: "デニムジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "クロップドパンツ"}, {name: "サロペット/オーバーオール"}, {name: "オールインワン"}, {name: "サルエルパンツ"}, {name: "ガウチョパンツ"}, {name: "その他"}])
lady_skirt.children.create([{name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"}, {name: "キュロット"}, {name: "その他"}])
lady_onePiece.children.create([{name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"}, {name: "その他"}])
lady_shoes.children.create([{name: "ハイヒール/パンプス"}, {name: "ブーツ"}, {name: "サンダル"}, {name: "スニーカー"}, {name: "ミュール"}, {name: "モカシン"}, {name: "ローファー/革靴"}, {name: "フラットシューズ/バレエシューズ"}, {name: "長靴/レインシューズ"}, {name: "その他"}])
lady_room.children.create([{name: "パジャマ"}, {name: "ルームウェア"}])
lady_leg.children.create([{name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "ストッキング/タイツ"}, {name: "レッグウォーマー"}, {name: "その他"}])
lady_cap.children.create([{name: "ニットキャップ"},{name: "ハット"}, {name: "ハンチング/ベレー帽"}, {name: "キャップ"}, {name: "キャスケット"}, {name: "麦わら帽子"}, {name: "その他"}])
lady_bag.children.create([{name: "ハンドバッグ"}, {name: "トートバッグ"}, {name: "エコバッグ"}, {name: "リュック/バックパック"}, {name: "ボストンバッグ"}, {name: "スポーツバッグ"}, {name: "ショルダーバッグ"}, {name: "クラッチバッグ"}, {name: "ポーチ/バニティ"}, {name: "ボディバッグ/ウェストバッグ"}, {name: "マザーズバッグ"}, {name: "メッセンジャーバッグ"}, {name: "ビジネスバッグ"}, {name: "旅行用バッグ/キャリーバッグ"}])
lady_accessory.children.create([{name: ""}, ])
lady_hairAccessory.children.create([{name: ""}, ])
lady_smallArticles.children.create([{name: ""}, ])
lady_watch.children.create([{name: ""}, ])

management = business_book.children.create(name: "経営")
management.children.create([{name: "経営全般"}, {name: "国際経営"}, {name: "法律"}, {name: "企業の歴史"}])

skill_up = business_book.children.create(name: "スキルアップ")
skill_up.children.create([{name: "仕事術"}, {name: "キャリアプラン"}, {name: "資格"}, {name: "語学"}, {name: "自己啓発"}])

finance = business_book.children.create(name: "金融")
finance.children.create([{name: "金融全般"}, {name: "お金の哲学"}, {name: "金融業務"}, {name: "税金"}])

job_category = business_book.children.create(name: "職種別")
job_category.children.create([{name: "経理"}, {name: "人事"}, {name: "秘書"}, {name: "情報管理"}, {name: "営業"}, {name: "マーケティング"}, {name: "広報"}, {name: "デザイン"}])

lifestyle = business_book.children.create(name: "ライフスタイル")
lifestyle.children.create([{name: "家庭・暮らし"}, {name: "健康"}, {name: "人生論・生き方"}, {name: "旅行"}, {name: "趣味・雑学"}, {name: "エンターテイメント"}, {name: "副業"}])

other = business_book.children.create(name: "その他")