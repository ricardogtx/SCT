Given(/^I visit the drugs page$/) do
	visit '/drogas' 
end

When(/^I press the Saiba mais button in alcool$/) do
	page.find('#btn_alcohol').click
end

Then(/^I am redirected to the Alcohol Saiba Mais page$/) do
	page.should have_title("SCT - Sistemas de Comunidades Terapeuticas")
end
