Fabricator(:recipe) do
  name { Faker::Lorem.sentence }
  description { Faker::Lorem.sentence }
  instructions { Faker::Lorem.paragraph }
  duration { 60 * (rand(119) + 1) }
  ingredients { rand(10).times.map { Fabricate.build(:ingredient) } }
end
