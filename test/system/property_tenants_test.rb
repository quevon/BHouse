require "application_system_test_case"

class PropertyTenantsTest < ApplicationSystemTestCase
  setup do
    @property_tenant = property_tenants(:one)
  end

  test "visiting the index" do
    visit property_tenants_url
    assert_selector "h1", text: "Property Tenants"
  end

  test "creating a Property tenant" do
    visit property_tenants_url
    click_on "New Property Tenant"

    fill_in "Property", with: @property_tenant.property_id
    fill_in "Status", with: @property_tenant.status
    fill_in "Tenant", with: @property_tenant.tenant_id
    click_on "Create Property tenant"

    assert_text "Property tenant was successfully created"
    click_on "Back"
  end

  test "updating a Property tenant" do
    visit property_tenants_url
    click_on "Edit", match: :first

    fill_in "Property", with: @property_tenant.property_id
    fill_in "Status", with: @property_tenant.status
    fill_in "Tenant", with: @property_tenant.tenant_id
    click_on "Update Property tenant"

    assert_text "Property tenant was successfully updated"
    click_on "Back"
  end

  test "destroying a Property tenant" do
    visit property_tenants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property tenant was successfully destroyed"
  end
end
