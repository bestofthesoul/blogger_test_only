require "rails_helper"

RSpec.describe Blog, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

end
