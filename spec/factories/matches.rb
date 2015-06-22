FactoryGirl.define do
  factory :match do
    result ( {"foo": "bar"}.to_json)
  end

end
