require 'rails_helper'
feature "visitor adds a question" do
scenario "adds a question" do
  ActionMailer::Base.deliveries.clear

  visit new_question_path

  fill_in "Name", with: "Paddy Tuck"
  fill_in "Question", with: "Who is Perry Tuck?"
  click_button "Ask Jenn!"

  expect(page).to have_content("Jenn will get back to you shortly")
  expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
