FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname               { Faker::Name.initials }
    email                  { Faker::Internet.free_email }
    password               { 'a3' + Faker::Internet.password(min_length: 6) }
    password_confirmation  { password }
    last_name              { person.last.kanji }
    first_name             { person.first.kanji }
    read_last_name         { person.last.katakana }
    read_first_name        { person.first.katakana }
    birth_day              { Faker::Date.backward }
  end
end
