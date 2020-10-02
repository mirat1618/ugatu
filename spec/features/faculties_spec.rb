require 'rails_helper'

RSpec.feature "Faculties", type: :feature do
  include_context 'user sign in'

  scenario 'analyst creates faculty' do
    visit faculties_path
    expect {
      click_link 'Создать'
      fill_in 'faculty[title]', with: 'Факультет информатики и робототехники'
      fill_in 'faculty[abbreviation]', with: 'ФИРТ'
      click_button 'Отправить'
    }.to change(Faculty.all, :count).by(1)
    expect(page).to have_content 'Факультет создан'
  end

  scenario 'admin deletes faculty', js: true do
    @user.admin!
    faculty = create(:faculty)

    expect {
      visit faculty_path(faculty)
      page.accept_confirm 'Удалить?' do
        click_link('Удалить')
      end
      #save_and_open_page
      find_link('Панель управления').click # gotta give it some time before checking deletion
    }.to change(Faculty, :count).by(-1)
  end
end
