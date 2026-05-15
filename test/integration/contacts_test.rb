require "test_helper"

class ContactsTest < ActionDispatch::IntegrationTest
  test "contacts index displays contact names" do
    Contact.create(first_name: "Tim", last_name: "Cook")
    Contact.create(first_name: "Dario", last_name: "Amodei")

    get "/contacts"

    assert_response :success

    assert_select "li", text: "Tim Cook"
    assert_select "li", text: "Dario Amodei"
  end
end