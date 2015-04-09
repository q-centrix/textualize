Feature: Textualize CLI
  In order to generate initial files
  As a user of the textualize documentation framework
  I want bootstrap the files necessary to start writing docs!

  Scenario: New
    When I run `textualize new my-app`
    Then the exit status should be 0
    And the file "my-app/.gitignore" should contain:
      """
      .tmp
      """
    And the file "my-app/package.json" should contain:
      """
      "name": "documentation",
      """
    And a file named "my-app/gulpfile.js" should exist
    And a directory named "my-app/tasks" should exist
    And a file named "my-app/apis/api.raml" should exist
    And the output should contain "Thank you for installing textualize"

