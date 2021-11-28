require "rails_helper"

RSpec.describe "New suscription", type: :system, js: true do
  describe "User create register" do 

    before do
      visit root_path
    end
    
    it "Success suscription when creating" do
      fill_in "suscription_email", with: "vale.af17@gmail.com"
      find(:css, "#span-women", visible: :all).click
      
      click_on I18n.t(".suscriptions.form.btn_label")
      
      expect(page).to have_content(I18n.t(".suscriptions.form.success_message"))
    end
    
    describe "Error suscription when creating" do
    
      it "when form has not data" do
        click_on I18n.t(".suscriptions.form.btn_label")
        
        expect(page).to have_content(I18n.t(".suscriptions.form.incomplete_message"))
      end
      
      it "when email format is not correct" do
        fill_in "suscription_email", with: "jfjdjsjj"
        find(:css, "#span-women", visible: :all).click
        
        click_on I18n.t(".suscriptions.form.btn_label")
        
        expect(page).to have_content(I18n.t(".suscriptions.form.errors_label"))
      end
    end
  end
  
  describe "Internationalization" do

    it "Spanish" do
      I18n.locale = :es

      expect(I18n.locale).to eq :es
    end

    it "English" do
      I18n.locale = :en

      expect(I18n.locale).to eq :en
    end
  end
end
