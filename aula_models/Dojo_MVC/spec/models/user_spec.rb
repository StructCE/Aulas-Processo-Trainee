require 'rails_helper'

RSpec.describe User, type: :model do
  it "funciona" do
    @test = User.new(name:"Pedro")
    expect(@test.name).to eq("Pedro")
  end
end
