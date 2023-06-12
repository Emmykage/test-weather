require 'rails_helper'

RSpec.describe "Locations", type: :model do
    subject { Location.new(name: "Lagos")}
    before {subject.save }
    

    it "name should be present" do
      subject.name =  nil
      expect(subject).to_not be_valid
    end
  
end
