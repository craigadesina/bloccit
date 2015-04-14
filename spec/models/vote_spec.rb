require 'rails_helper'

RSpec.describe Vote, type: :model do
  
        describe "validations" do
        describe "value validation" do
        it "only allows -1 or 1 as values" do
        @vote = Vote.new
        if @vote.value == 1 or @vote.value == -1
          expect( @vote.save ).to eq(true)
        else
          expect( @vote.save ).to eq(false)
        end
      end
    end
  end
end
