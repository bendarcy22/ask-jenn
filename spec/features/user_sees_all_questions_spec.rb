require 'rails_helper'
feature "visitor sees a list of questions" do
  let!(:question_1) { create :question }
  let!(:question_2) { create :question }
  scenario "sees a list of questions" do
    visit questions_path
    expect(page).to have_link(question_1.body)
    expect(page).to have_link(question_2.body)
  end
  scenario "clicks link and is taken to show page for given question" do
    visit questions_path
    click_link(question_1.body)
    expect(page).to have_content question_1.body
    expect(page).to have_content question_1.name
  end
end
