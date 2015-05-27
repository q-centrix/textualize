@increase_wait_time
Feature: Textualize CLI
  In order to serve a directory of json
  As a user of the textualize documentation framework
  I want to create a folder with json matching urls

  Scenario: Creating the server folder
    When I set up Textualize and run "textualize request_specs"
    Then the file "my-app/dist/base/spec/requests/get_items_spec.rb" should contain:
    """
    describe 'GET /api/v1/items'
    """
    And the file "my-app/dist/base/spec/requests/post_items_spec.rb" should contain:
    """
    describe 'POST /api/v1/items'
    """
    And the file "my-app/dist/base/spec/requests/delete_item_spec.rb" should contain:
    """
    ["staff"]
    """
