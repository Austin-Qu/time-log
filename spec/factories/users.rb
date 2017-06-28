FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    first_name "qwe"
    last_name "sdf"
    email { generate :email }
    password "qweqweqqwe"
    password_confirmation "qweqweqqwe"
    phone "0452198717"
  end

  factory :admin_user, class: "AdminUser" do
    first_name "Admin"
    last_name "User"
    email { generate :email }
    password "qweqweqqwe"
    password_confirmation "qweqweqqwe"
    phone "0452198717"
  end

  factory :non_authorized_user, class: "User" do
    first_name "Non"
    last_name "Authorized"
    email { generate :email }
    password "qweqweqqwe"
    password_confirmation "qweqweqqwe"
    phone "0452198717"
  end
end
