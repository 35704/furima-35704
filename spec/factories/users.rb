FactoryBot.define do
  factory :user do
    nickname {"nickname"}
    email {Faker::Internet.free_email}
    password {"aaa123"}
    password_confirmation {password}
    first_name {"佐藤"}
    last_name {"隆史"}
    first_name_kana {"サトウ"}
    last_name_kana {"リュウジ"}
    birthday {"2021-05-29"}
  end  
end