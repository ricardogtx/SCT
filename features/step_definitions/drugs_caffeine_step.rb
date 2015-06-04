When(/^I press the 'Saiba mais' button in caffeine$/) do
  page.find('#btn_caffeine').click
end

Then(/^I am redirected to the caffeine page$/) do
  page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
