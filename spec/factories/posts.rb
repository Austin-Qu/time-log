FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some first rationale"
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more rationale"
    user
  end

  factory :post_from_another_user, class: "Post" do
    date Date.today
    rationale "other rationale"
    association :user, factory: :non_authorized_user
  end
end
