FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some first rationale"
    overtime_request 3.5
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale "Some more rationale"
    overtime_request 5.5
    user
  end

  factory :post_from_another_user, class: "Post" do
    date Date.today
    rationale "other rationale"
    association :user, factory: :non_authorized_user
    overtime_request 4.5
  end
end
