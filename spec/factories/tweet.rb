FactoryBot.define do
  factory :tweet do
    tweet_id     { FFaker::SSNSE.ssn }
    text         { FFaker::DizzleIpsum.sentence }
    username     { FFaker::Internet.user_name }
    topic        { create(:topic) }
  end
end
