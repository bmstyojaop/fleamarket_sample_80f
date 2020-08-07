business_book = Category.create(name: "ビジネス書")

economy = business_book.children.create(name: "経済")
economy.children.create([{name: "ビジネス経済"}, {name: "日本経済"}, {name: "国際経済"}, {name: "経済学全般"}])

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