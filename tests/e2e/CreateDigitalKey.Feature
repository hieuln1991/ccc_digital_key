Feature: Create a Digital Key from the CarMaker App

  Scenario: Successfully create a digital key from the CarMaker app
      Given the user has installed the CarMaker app on a compatible smartphone
      And the user is logged into their CarMaker account
      And the user’s vehicle is linked to their account
      And the smartphone has an active internet connection
      When the user selects the option to create a digital key
      And follows the on-screen instructions to authenticate with Face ID, Touch ID, or PIN
      And confirms the key creation request
      Then the system should securely generate a digital key
      And the digital key should be stored in the CarMaker app
      And the user should receive a confirmation message stating "Digital Key created successfully"

 Scenario: User attempts to create a digital key without an internet connection
    Given the user has installed the CarMaker app
    And the user is logged into their CarMaker account
    But the smartphone does not have an active internet connection
    When the user tries to create a digital key
    Then the system should display an error message stating "Internet connection required to create a digital key"
    And the digital key should not be created

 Scenario: User attempts to create a digital key for an unlinked vehicle
    Given the user has installed the CarMaker app
    And the user is logged into their CarMaker account
    But the user’s vehicle is not linked to their account
    When the user tries to create a digital key
    Then the system should display an error message stating "No linked vehicle found"
    And the digital key should not be created

Scenario: Authentication failure during digital key creation
    Given the user has installed the CarMaker app
    And the user is logged into their CarMaker account
    And the user’s vehicle is linked to their account
    When the user attempts to create a digital key
    But authentication via Face ID, Touch ID, or PIN fails
    Then the system should display an error message stating "Authentication failed"
    And the digital key should not be created

 Scenario: Digital key creation fails due to server issues
    Given the user has installed the CarMaker app
    And the user is logged into their CarMaker account
    And the user’s vehicle is linked to their account
    And the smartphone has an active internet connection
    When the user tries to create a digital key
    But the CarMaker server is unavailable
    Then the system should display an error message stating "Unable to create digital key. Please try again later."
    And the digital key should not be created
