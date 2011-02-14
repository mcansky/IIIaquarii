FactoryGirl.define do
  factory :user do
    email 'rhaamo+test@gruik.at'
    password 'toto1234AAA'
    name 'toto'
    login 'toto'
  end

  factory :tutu, :class => User do
    email 'rhaamo+tutu@gruik.at'
    password 'omglol'
    login 'tutu'
  end
end
