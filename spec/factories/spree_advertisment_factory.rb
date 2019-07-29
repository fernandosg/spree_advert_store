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

    trait :type_image do
      type_advertisement "image"
    end

    trait :type_video do
      type_advertisement "video"
    end

    trait :type_text do
      type_advertisement "text"
    end
  end
end
