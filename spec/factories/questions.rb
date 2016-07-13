FactoryGirl.define do
  factory :question do
    sequence(:name) { |n| "Name#{n}" }
    sequence(:body) { |n| "This is question number #{n}" }
  end
end
