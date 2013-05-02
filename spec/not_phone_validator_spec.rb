# encoding: UTF-8
require 'spec_helper'

describe NotEmailValidator do
  test_class = Class.new do
    include ActiveModel::Validations
    attr_accessor :person
    validates :person, :not_phone => true
  end

  describe "validating not phone" do
    before :each do
      I18n.locale = :ru
    end
    let!(:errors) { [ "не должно содержать телефонный номер" ] }

    subject { test_class.new }

    it "should be valid when empty" do
      subject.valid?.should be_true
    end

    it "should be not valid when contains phone" do
      subject.person = "74951231212"
      subject.valid?.should be_false
      subject.errors[:person].should == errors
    end

    it "should be not valid when not contains phone" do
      subject.person = "Sergey Chupis"
      subject.valid?.should be_true
    end
  end
end