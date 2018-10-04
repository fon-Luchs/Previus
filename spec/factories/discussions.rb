FactoryBot.define do
  factory :discussion do
    topic_id { 1 }
    user_id { 1 }
    comment { "MyText" }
  end
end
