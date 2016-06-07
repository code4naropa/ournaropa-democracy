FactoryGirl.define do
  factory :ournaropa_decisions_feedback, class: 'OurnaropaDecisions::Feedback' do
    content "MyText"
    email "MyString"
    wants_to_stay_informed false
  end
end
