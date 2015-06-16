Given(/^I visit the drugs page$/) do
	visit '/drogas' 
end

When(/^I press the Saiba mais button in alcool$/) do
	page.find('#btn_alcohol').click
end

Then(/^I am redirected to the Alcohol Saiba Mais page$/) do
	page.should have_content("Quadro resumo: Álcool")
end

When(/^I press the 'Saiba mais' button in amphetamines$/) do
  page.find('#btn_amphetamine').click
end

Then(/^I am redirected to the ampheamines page$/) do
  page.should have_content("Quadro resumo: Anfetaminas")
end

When(/^I press the 'Saiba mais' button in antidepressants$/) do
  page.find('#btn_antidepressant').click
end

Then(/^I am redirected to the antidepressants page$/) do
  page.should have_content("Quadro resumo: Antidepressivos")
end

When(/^I press the Saiba mais button in barbiturates$/) do
  page.find('#btn_barbiturates').click
end

Then(/^I am redirected to the barbiturates page$/) do
  page.should have_content("Quadro resumo: Barbitúricos")
end

When(/^I press the 'Saiba mais' button in caffeine$/) do
  page.find('#btn_caffeine').click
end

Then(/^I am redirected to the caffeine page$/) do
  page.should have_content("Quadro resumo: Cafeína")
end

When(/^I press the 'Saiba mais' button in cannabis$/) do
  page.find('#btn_cannabis').click
end

Then(/^I am redirected to the cannabis page$/) do
  page.should have_content("Quadro resumo: Cannabis Sativa")
end

When(/^I press the 'Saiba mais' button in cocaine$/) do
  page.find('#btn_cocaine').click
end

Then(/^I am redirected to the cocaine page$/) do
  page.should have_content("Quadro resumo: Cocaína")
end

When(/^I press the Saiba mais button in hallucinogens$/) do
  page.find('#btn_hallucinogen').click
end

Then(/^I am redirected to the hallucinoges page$/) do
  page.should have_content("Quadro resumo: Alucinógenos")
end

When(/^I press the 'Saiba mais' button in inhalants$/) do
  page.find('#btn_inhalants').click
end

Then(/^I am redirected to the inhalants page$/) do
  page.should have_content("Quadro resumo: Inalantes")
end

When(/^I press the 'Saiba mais' button in narcotics$/) do
  page.find('#btn_narcotics').click
end

Then(/^I am redirected to the narcotics page$/) do
  page.should have_content("Quadro resumo: Narcóticos")
end

When(/^I press the 'Saiba mais' button in nicotine$/) do
  page.find('#btn_nicotine').click
end

Then(/^I am redirected to the nicotine page$/) do
  page.should have_content("Quadro resumo: Nicotina")
end

When(/^I press the 'Saiba mais' button in tranquilizer$/) do
  page.find('#btn_tranquilizer').click
end

Then(/^I am redirected to the tranquilizer page$/) do
  page.should have_content("Quadro resumo: Tranquilizantes")
end