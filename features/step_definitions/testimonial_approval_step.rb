Given(/^there is a testimonial waiting for my approval$/) do
  @testimonial = Testimonial.create!(title: "Cucumber", body: "Cucumber test", testimonial_authenticate: nil)
end

When(/^I click on the testimonial name$/) do
  click_link(@testimonial.title)
end

Then(/^I'm redirected to that testimonial specific page$/) do
  expect(current_path).to eq(testimonial_approval_path)
end

When(/^I click on Editar button$/) do
  click_link("Editar")
end

Then(/^I'm redirected to that testimonial edit page\.$/) do
  expect(current_path).to eq(testimonials_approval_edit_path)
end

When(/^I click on Aceitar button$/) do
  click_link("Aceitar")
end

Then(/^I'm redirected to the admin page with a succesful message$/) do
  expect(current_path).to eq(admin_path)
  expect(page).to have_content("Depoimento aprovado")
end

When(/^I click on Recusar button$/) do
  click_link("Recusar")
end

Then(/^I'm redirected to the admin page with a succesful deletion message$/) do
  expect(current_path).to eq(admin_path)
  expect(page).to have_content("Depoimento deletado")
end
