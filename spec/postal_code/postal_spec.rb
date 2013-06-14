# postal spec
require 'spec_helper'

describe PostalCode::Postal do
  before {@postal = PostalCode::Postal.new}
  subject {@postal}

  it {should respond_to(:jis_code)}
  it {should respond_to(:former_post_code)}
  it {should respond_to(:post_code)}
  it {should respond_to(:province_kana)}
  it {should respond_to(:city_kana)}
  it {should respond_to(:town_kana)}
  it {should respond_to(:province_kanji)}
  it {should respond_to(:city_kanji)}
  it {should respond_to(:town_kanji)}
  it {should respond_to(:plural_code)}
  it {should respond_to(:unknown)}
  it {should respond_to(:district_of_a_town)}
  it {should respond_to(:plural_town)}
  it {should respond_to(:update)}
  it {should respond_to(:update_reason)}

  describe "#match_conditions" do
    before {@postal = PostalCode::Postal.new(jis_code: "123123",
                                             former_post_code: "252",
                                             post_code: "2520815",
                                             province_kana: "province",
                                             city_kana: "city",
                                             town_kana: "town",
                                             province_kanji: "province",
                                             city_kanji: "city",
                                             town_kanji: "town",
                                             plural_code: 0,
                                             unknown: 0,
                                             district_of_a_town: 0,
                                             plural_town: 0,
                                             update: 0,
                                             update_reason: 0)}
    context "match condition" do
      let(:conditions){ {post_code: "2520815", province_kana: "province"} }
      it {@postal.match_conditions?(conditions).should == true}
    end

    context "not match condition" do
      let(:conditions){ {post_code: "2342342"} }
      it {@postal.match_conditions?(conditions).should == false}
    end
    
    context "error params" do
      let(:conditions){ {asdf: "asdf"} }
      it {@postal.match_conditions?(conditions).should == false}
    end

  end

end
