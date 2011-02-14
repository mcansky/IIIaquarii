FactoryGirl.define do
  factory :aq_repository do
    name 'test-repository'
    kind 'git'
    visibility 0
  end

  factory :repo, :class => AqRepository do
    name 'test-repo'
    kind 'git'
    visibility 1
    desc 'Test repository'
  end
end
