# 親
lady = Category.create(name: "レディース")
man = Category.create(name: "メンズ")
kids = Category.create(name: "ベビー・キッズ")
interior = Category.create(name: "インテリア・住まい・小物")
book = Category.create(name: "本・音楽・ゲーム")
hobby = Category.create(name: "おもちゃ・ホビー・グッズ")
beauty = Category.create(name: "コスメ・香水・美容")
election = Category.create(name: "家電・スマホ・カメラ")
sport = Category.create(name: "スポーツ・レジャー")
handmade = Category.create(name: "ハンドメイド")
ticket = Category.create(name: "チケット")
bike = Category.create(name: "自転車・オートバイ")
etcetera = Category.create(name: "その他")

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
lady_wig = lady.children.create(name: "ウィッグ/エクステ")
lady_summer = lady.children.create(name: "浴衣/水着")
lady_suits = lady.children.create(name: "スーツ/フォーマル/ドレス")
lady_maternity = lady.children.create(name: "マタニティ")
lady_etcetra = lady.children.create(name: "その他")


man_tops = man.children.create(name: "トップス")
man_jacket = man.children.create(name: "ジャケット/アウター")
man_pants = man.children.create(name: "パンツ")
man_shoes = man.children.create(name: "靴")
man_bag = man.children.create(name: "バッグ")
man_suits = man.children.create(name: "スーツ")
man_cap = man.children.create(name: "帽子")
man_accessory = man.children.create(name: "アクセサリー")
man_smallArticles = man.children.create(name: "小物")
man_watch = man.children.create(name: "時計")
man_summer = man.children.create(name: "水着")
man_leg = man.children.create(name: "レッグウェア")
man_under = man.children.create(name: "アンダーウェア")
man_etcetra = man.children.create(name: "その他")


# 孫

lady_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ/ブラウス(半袖/袖なし)"}, {name: "シャツ/ブラウス(七分/長袖)"}, {name: "ポロシャツ"}, {name: "キャミソール"}, {name: "タンクトップ"}, {name: "ホルターネック"}, {name: "ニット/セーター"}, {name: "チェニック"}, {name: "カーディガン/ボレロ"}, {name: "アンサンブル"}, {name: "ベスト/ジレ"}, {name: "パーカー"}, {name: "トレーナー/スウェット"}, {name: "ペアトップ/チューブトップ"}, {name: "ジャージ"}, {name: "その他"}])
lady_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ミリタリージャケット"}, {name: "ダウンベスト"}, {name: "ジャンパー/ブルゾン"}, {name: "ポンチョ"}, {name: "ロングコート"}, {name: "トレンチコート"}, {name: "ダッフルコート"}, {name: "ピーコート"}, {name: "チェスターコート"}, {name: "モッズコート"}, {name: "スタジャン"}, {name: "毛皮/ファーコート"}, {name: "スプリングコート"}, {name: "スカジャン"}, {name: "その他"}])
lady_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ショートパンツ"}, {name: "カジュアルパンツ"}, {name: "ハーフパンツ"}, {name: "チノパン"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "クロップドパンツ"}, {name: "サロペット/オーバーオール"}, {name: "オールインワン"}, {name: "サルエルパンツ"}, {name: "ガウチョパンツ"}, {name: "その他"}])
lady_skirt.children.create([{name: "ミニスカート"}, {name: "ひざ丈スカート"}, {name: "ロングスカート"}, {name: "キュロット"}, {name: "その他"}])
lady_onePiece.children.create([{name: "ミニワンピース"}, {name: "ひざ丈ワンピース"}, {name: "ロングワンピース"}, {name: "その他"}])
lady_shoes.children.create([{name: "ハイヒール/パンプス"}, {name: "ブーツ"}, {name: "サンダル"}, {name: "スニーカー"}, {name: "ミュール"}, {name: "モカシン"}, {name: "ローファー/革靴"}, {name: "フラットシューズ/バレエシューズ"}, {name: "長靴/レインシューズ"}, {name: "その他"}])
lady_room.children.create([{name: "パジャマ"}, {name: "ルームウェア"}])
lady_leg.children.create([{name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "ストッキング/タイツ"}, {name: "レッグウォーマー"}, {name: "その他"}])
lady_cap.children.create([{name: "ニットキャップ"},{name: "ハット"}, {name: "ハンチング/ベレー帽"}, {name: "キャップ"}, {name: "キャスケット"}, {name: "麦わら帽子"}, {name: "その他"}])
lady_bag.children.create([{name: "ハンドバッグ"}, {name: "トートバッグ"}, {name: "エコバッグ"}, {name: "リュック/バックパック"}, {name: "ボストンバッグ"}, {name: "スポーツバッグ"}, {name: "ショルダーバッグ"}, {name: "クラッチバッグ"}, {name: "ポーチ/バニティ"}, {name: "ボディバッグ/ウェストバッグ"}, {name: "マザーズバッグ"}, {name: "メッセンジャーバッグ"}, {name: "ビジネスバッグ"}, {name: "旅行用バッグ/キャリーバッグ"}, {name: "ショップ袋"}, {name: "和装用バッグ"}, {name: "かごバッグ"}, {name: "その他"}])
lady_accessory.children.create([{name: "ネックレス"}, {name: "ブレスレット"}, {name: "バンクル/リストバンド"}, {name: "リング"}, {name: "ピアス(片耳用)"}, {name: "ピアス(両耳用)"}, {name: "イヤリング"}, {name: "アンクレット"}, {name: "ブローチ/コサージュ"}, {name: "チャーム"}, {name: "その他"}])
lady_hairAccessory.children.create([{name: "ヘアゴム"}, {name: "ヘアバンド/カチューシャ"}, {name: "ヘアピン"}, {name: "その他"}])
lady_smallArticles.children.create([{name: "長財布"}, {name: "折り財布"}, {name: "コインケース/小銭入れ"}, {name: "名刺入れ/定期入れ"}, {name: "キーケース"}, {name: "キーホルダー"}, {name: "手袋/アームカバー"}, {name: "ハンカチ"}, {name: "ベルト"}, {name: "マフラー/ショーツ"}, {name: "ストール/スヌード"}, {name: "バンダナ/スカーフ"}, {name: "ネックウォーマー"}, {name: "サスペンダー"}, {name: "サングラス/メガネ"}, {name: "モバイルケース/カバー"}, {name: "手帳"}, {name: "イヤマフラー"}, {name: "傘"}, {name: "レインコート/ポンチョ"}, {name: "ミラー"}, {name: "タバコグッズ"}, {name: "その他"}])
lady_watch.children.create([{name: "腕時計(アナログ)"}, {name: "腕時計(デジタル)"}, {name: "ラバーベルト"}, {name: "レザーベルト"}, {name: "金属ベルト"}, {name: "その他"}])
lady_wig.children.create([{name: "前髪ウィッグ"}, {name: "ロングストレート"}, {name: "ロングカール"}, {name: "ショートストレート"}, {name: "ショートカール"}, {name: "その他"}])
lady_summer.children.create([{name: "浴衣"}, {name: "着物"}, {name: "振袖"}, {name: "長襦袢/半襦袢"}, {name: "水着セパレート"}, {name: "水着ワンピース"}, {name: "スポーツ"}, {name: "その他"}])
lady_suits.children.create([{name: "スカートスーツ上下"}, {name: "パンツスーツ上下"}, {name: "ドレス"}, {name: "パーティバッグ"}, {name: "シューズ"}, {name: "ウェディング"}, {name: "その他"}])
lady_maternity.children.create([{name: "トップス"}, {name: "アウター"}, {name: "インナー"}, {name: "ワンピース"}, {name: "パンツ/スパッツ"}, {name: "スカート"}, {name: "パジャマ"}, {name: "授乳服"}, {name: "その他"}])
lady_etcetra.children.create([{name: "コスプレ"}, {name: "下着"}, {name: "その他"}])

man_tops.children.create([{name: "Tシャツ/カットソー(半袖/袖なし)"}, {name: "Tシャツ/カットソー(七分/長袖)"}, {name: "シャツ"}, {name: "ポロシャツ"}, {name: "タンクトップ"}, {name: "ニット/セーター"}, {name: "パーカー"}, {name: "カーディガン"}, {name: "スウェット"}, {name: "ジャージ"}, {name: "ベスト"}, {name: "その他"}])
man_jacket.children.create([{name: "テーラードジャケット"}, {name: "ノーカラージャケット"}, {name: "Gジャン/デニムジャケット"}, {name: "レザージャケット"}, {name: "ダウンジャケット"}, {name: "ライダースジャケット"}, {name: "ナイロンジャケット"}, {name: "フライトジャケット"}, {name: "ダッフルコート"}, {name: "ピーコート"}, {name: "ステンカラーコート"}, {name: "トレンチコート"}, {name: "モッズコート"}, {name: "チェスターコート"}, {name: "スタジャン"}, {name: "スカジャン"}, {name: "ブルゾン"}, {name: "マウンテンパーカー"}, {name: "ダウンベスト"}, {name: "ポンチョ"}, {name: "カバーオール"}, {name: "その他"}])
man_pants.children.create([{name: "デニム/ジーンズ"}, {name: "ワークパンツ/カーゴパンツ"}, {name: "スラックス"}, {name: "チノパン"}, {name: "ショートパンツ"}, {name: "ペインターパンツ"}, {name: "サルエルパンツ"}, {name: "オーバーオール"}, {name: "その他"}])
man_shoes.children.create([{name: "スニーカー"}, {name: "サンダル"}, {name: "ブーツ"}, {name: "モカシン"}, {name: "ドレス/ビジネス"}, {name: "長靴/レインシューズ"}, {name: "デッキシューズ"}, {name: "その他"}])
man_bag.children.create([{name: "ショルダーバッグ"}, {name: "トートバッグ"}, {name: "ボストンバッグ"}, {name: "リュック/バックパック"}, {name: "ウエストポーチ"}, {name: "ボディーバッグ"}, {name: "ドラムバッグ"}, {name: "ビジネスバッグ"}, {name: "トラベルバッグ"}, {name: "メッセンジャーバッグ"},  {name: "エコバッグ"}, {name: "その他"}])
man_suits.children.create([{name: "スーツジャケット"}, {name: "スーツベスト"}, {name: "スラックス"}, {name: "セットアップ"}, {name: "その他"}])
man_cap.children.create([{name: "キャップ"}, {name: "ハット"}, {name: "ニットキャップ/ビーニー"}, {name: "ハンチング/ベレー帽"}, {name: "キャスケット"}, {name: "サンバイザー"}, {name: "その他"}])
man_accessory.children.create([{name: "ネックレス"}, {name: "ブレスレット"}, {name: "バンクル/リストバンド"}, {name: "リング"}, {name: "ピアス(片耳用)"}, {name: "ピアス(両耳用)"}, {name: "アンクレット"}, {name: "その他"}])
man_smallArticles.children.create([{name: "長財布"}, {name: "折り財布"}, {name: "マネークリップ"}, {name: "コインケース/小銭入れ"}, {name: "名刺入れ/定期入れ"}, {name: "キーケース"}, {name: "キーホルダー"}, {name: "ネクタイ"}, {name: "手袋"}, {name: "ハンカチ"}, {name: "ベルト"}, {name: "マフラー"}, {name: "ストール"}, {name: "バンダナ"}, {name: "ネックウォーマー"}, {name: "サスペンダー"}, {name: "ウォレットチェーン"}, {name: "サングラス/メガネ"}, {name: "モバイルケース/カバー"}, {name: "手帳"}, {name: "ストラップ"}, {name: "ネクタイピン"}, {name: "カフリンクス"}, {name: "イヤマフラー"}, {name: "傘"}, {name: "レインコート"}, {name: "ミラー"}, {name: "タバコグッズ"}, {name: "その他"}])
man_watch.children.create([{name: "腕時計(アナログ)"}, {name: "腕時計(デジタル)"}, {name: "ラバーベルト"}, {name: "レザーベルト"}, {name: "金属ベルト"}, {name: "その他"}])
man_summer.children.create([{name: "一般水着"}, {name: "スプーツ用"}, {name: "アクセサリー"}, {name: "その他"}])
man_leg.children.create([{name: "ソックス"}, {name: "スパッツ/レギンス"}, {name: "レッグウォーマー"}, {name: "その他"}])
man_under.children.create([{name: "トランクス"}, {name: "ボクサーパンツ"}, {name: "その他"}])

