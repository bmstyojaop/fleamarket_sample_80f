FactoryBot.define do

  factory :user do
    nickname              {"jinnan"}
    email                 {"kkk@gmail.com"}
    family_name           {"神なン"}
    first_name            {"太ろウ"}
    family_name_kana      {"ジンナン"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-01-01"}
    password              {"abcdefgh"}
    password_confirmation {"abcdefgh"}
  end

end
