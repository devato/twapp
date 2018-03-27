FactoryBot.define do

  factory :topic do
    name { FFaker::DizzleIpsum.word }
  end
end
