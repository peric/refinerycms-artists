
FactoryGirl.define do
  factory :artist, :class => Refinery::Artists::Artist do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

