FactoryBot.define do
    factory :spree_advertisment_configuration, class: 'Spree::AdvertismentsConfiguration' do
        preferences 
    end

    trait :enable_copnfiguration do
        preferences "{enable: true}"
    end

    trait :disable_copnfiguration do
        preferences "{enable: false}"
    end
end