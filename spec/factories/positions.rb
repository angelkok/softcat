FactoryGirl.define do
  factory :position do
    sequence(:name) {|n| "Position #{n}" }
  end
end
