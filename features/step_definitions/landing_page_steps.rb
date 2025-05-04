When("I visit the landing page") do
  visit root_path
end

Then("I am welcomed with a friendly message") do
  expect(page).to have_content("Welcome to the Budget Categorizer!")
end
