require "csv"

CSV.open("data_one.csv", "wb", :write_headers => true, :headers => ["name", "price"]) do |csv|
  csv << ["mixed fruit", "$2.15"]
  csv << ["french fries", "$2.75"]
  csv << ["side salad", "$3.35"]
  csv << ["hot wings", "$3.55"]
  csv << ["mozzarella sticks", "$4.20"]
  csv << ["sampler plate", "$5.80"]
end

CSV.open("data_two.csv", "wb", :write_headers => true, :headers => ["name", "price"]) do |csv|
  csv << ["mixed veggies", "$2.15"]
  csv << ["baked potato", "$2.75"]
  csv << ["giant salad", "$3.35"]
  csv << ["buffalo wings", "$3.55"]
  csv << ["burger", "$3.25"]
  csv << ["pasta", "$5.80"]
  csv << ["ice cream", "$2.50"]
end

CSV.open("data_three.csv", "wb", :write_headers => true, :headers => ["name", "price"]) do |csv|
  csv << ["chicken sandwich", "$5.00"]
  csv << ["italian beef", "$5.00"]
  csv << ["jumbo hot dog", "$5.00"]
  csv << ["chili dog", "$5.00"]
  csv << ["gyros sandwich", "$5.00"]
end
