Fabricator(:ingredient) do
  name { Faker::Lorem.word }
  quantity { (rand() * rand(10)).round(2) + 1 }
  units { %w[spoons cans kg pieces].sample }
end
