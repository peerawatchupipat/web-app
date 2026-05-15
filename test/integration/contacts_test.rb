require "test_helper"

class ContactsTest < ActionDispatch::IntegrationTest
  test "contacts index displays contact names and company" do
    company = Company.create(name: "Apple")
    Contact.create(first_name: "Tim", last_name: "Cook", company_id: company.id)
    Contact.create(first_name: "Dario", last_name: "Amodei", company_id: company.id)

    get "/contacts"

    assert_response :success

    assert_select "li", text: "Tim Cook - Apple"
    assert_select "li", text: "Dario Amodei - Apple"
  end
end