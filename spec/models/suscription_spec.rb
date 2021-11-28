require "rails_helper"

RSpec.describe Suscription, type: :model do
  describe "#create" do
    subject{ 
      described_class.new(email: "aguila1794@gmail.com",
                          preferences: { "women": true, "men": true })
    }
    
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without attributes" do
      subject.email = nil
      subject.preferences = nil
      expect(subject).not_to be_valid
    end

    context "email attribute" do
      it "should have a unique email" do
        should validate_uniqueness_of(:email)
      end

      it "is valid with email format" do
        subject.email = "aguila1794@gmail.com"
        expect(subject).to be_valid
      end
      
      it "is not valid without email" do
        subject.email = nil
        expect(subject).not_to be_valid
      end

      it "is not valid with bad email format" do
        subject.email = "asdfsdfads"
        expect(subject).not_to be_valid
      end

      # NOTE: This spec does not pass if abstract api request is not success or
      # is not process because model will take email as correct
      it "is not valid with email format but not existing" do
        subject.email = "asdfsdfads@asdfasdf.sdd"
        expect(subject).not_to be_valid
      end
    end

    context "preferences attribute" do
      it "is valid with elements on json" do
        subject.preferences = { "women": true, "men": true, "children": false }
        expect(subject).to be_valid
      end
      
      it "is not valid without preferences" do
        subject.preferences = nil
        expect(subject).not_to be_valid
      end
      
      it "is not valid with empty json {} on preferences" do
        subject.preferences = {}
        expect(subject).not_to be_valid
      end
      
      it "is not valid with string hash \"{}\" on preferences" do
        subject.preferences = "{}"
        expect(subject).not_to be_valid
      end
      
      it "is not valid with empty string" do
        subject.preferences = ""
        expect(subject).not_to be_valid
      end
    end
  end
end
