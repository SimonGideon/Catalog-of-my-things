require_relative './spec_helper'

describe Genre do
    before(:each) do
        @genre = Genre.new("pop")
    end

    describe "#new" do
        context "with no parameters" do
            it "raises an ArgumentError" do
                expect { Genre.new }.to raise_error(ArgumentError)
            end
        end
        context "check instance variables" do
            it "takes one parameter and returns a Genre object" do
                expect(@genre).to be_an_instance_of Genre
            end
        end 
        it "returns a genre object that responds to name" do
            expect(@genre).to respond_to :name
        end
    end
end
