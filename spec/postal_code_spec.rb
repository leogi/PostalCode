require 'spec_helper'
require 'postal_code'

describe PostalCode::JapanPostal do
  before {@jpostal = PostalCode::JapanPostal.instance}
  subject(){@jpostal}

  it{ should respond_to(:detect)}

  context "import csv success" do
    subject {@jpostal.postals.is_a?(Array)}
    it {should == true}
  end

  context "#detect" do
    subject {@jpostal.detect(former_post_code: "066").length}
    it {should_not == 0}
  end

  context ".where" do
    subject {PostalCode::JapanPostal.where(former_post_code: "252").length}
    it {should_not == 0}
  end
end
