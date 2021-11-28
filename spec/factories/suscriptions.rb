# Factory for subscriptions

FactoryBot.define do
  factory :suscription, class: Suscription do
    email { "aguila1794@mail.com" }
    preferences { { "women": true, "men": true, "children": false } }
  end
end
