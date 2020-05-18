require 'rails_helper'

RSpec.describe User, :type => :model do

    subject { User.new(name: "Alexis", email: "frontenis_@hotmail.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "should have many teams" do
    
    t = User.reflect_on_association(:microposts)
    expect(t.macro).to eq(:has_many)
  end

end
