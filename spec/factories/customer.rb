FactoryBot.define do
    factory :customer do
        name { "鈴木太郎" }
        gender { 0 }
        birthday { "1990/02/18" }
        organization_id { 1 }
    end
end