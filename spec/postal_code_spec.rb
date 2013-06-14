require 'spec_helper'

describe PostalCode::JapanPostal do
  before {@jpostal = PostalCode::JapanPostal.instance}
  subject(){@jpostal}

  it{ should respond_to(:detect)}

  context "import csv success" do
    subject {@jpostal.postals.is_a?(Array)}
    it {should == true}
  end

  describe "#detect" do
    subject {@jpostal.detect(former_post_code: "066").length}
    it {should_not == 0}
  end

  describe ".where" do
    subject {PostalCode::JapanPostal.where(former_post_code: "252").length}
    it {should_not == 0}
  end

  describe "#first" do
    it {@jpostal.first.should == @jpostal.postals.first}
  end

  describe "#last" do
    it {@jpostal.last.should == @jpostal.postals.last}
  end

  describe "#object_at" do

    context "one of argument" do
      it {@jpostal.object_at(0).should_not nil}
    end

    context "two of argument" do
      it {@jpostal.object_at(0, 2).length.should == 2}
    end
    
    context "argument is range" do
      it {@jpostal.object_at(1..10).length.should == 10}
    end

    context "invalid integer argument" do
      it {@jpostal.object_at("0").should == nil}
    end

    context "invalid number of arrgument" do
      it {@jpostal.object_at(1,2,3,4).should == nil}
    end

  end

  describe ".all" do
    before {@postals = PostalCode::JapanPostal.all}
    it {@postals.is_a?(Array).should == true}
  end

end
