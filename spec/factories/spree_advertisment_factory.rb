FactoryBot.define do
  factory :spree_advertisment, class: 'Spree::Advertisment' do
    code  { generate(:random_string) }
    content {generate(:random_string)}
    type_advertisement {generate(:random_string)}

    trait :by_product do
      advrt_rf { |a| a.association(:product)}
    end

    trait :by_taxon do
      advrt_rf { |a| a.association(:taxon)}
    end
  end
end
