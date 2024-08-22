FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { 'password' }  
    password_confirmation { password }
    lastname              { '山田' }   
    firstname             { '太郎' }  
    lastname_yomi         { 'ヤマダ' } 
    firstname_yomi        { 'タロウ' } 
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65).to_s } # 適切な日付形式を生成
  end
end