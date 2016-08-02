FactoryGirl.define do
  factory :blog do
    title "Day XX"
    content "Feeling Moody today"
    association :user
  end

end
