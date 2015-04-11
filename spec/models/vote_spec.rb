describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        if @vote.value == 1 or @vote.value == -1
        expect( @vote.value.save! ).to eq(true)
        else
        expect( @vote.value.save! ).to eq(false)
        end
      end
    end
  end
end