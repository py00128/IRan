require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return contact email" do
    mail = ContactMailer.contact_email("parsa@me.com", "Parsa Yaghoobi", "1234567890", @message = "Hello")
    assert_equal ['info@iran.com'], mail.to
    assert_equal ['from@example.com'], mail.from
  end
end
