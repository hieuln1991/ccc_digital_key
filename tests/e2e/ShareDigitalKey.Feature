Feature: Share Digital Key with Another User

  Scenario: Successfully share a digital key with another user
    Given the user has a valid Digital Key stored in Apple Wallet or Google Wallet
    And the user has an active internet connection
    And the recipient's phone number or email is known
    When the user selects the option to share the digital key
    And enters the recipient's phone number or email
    And confirms the sharing request
    Then the system should send a digital key invitation to the recipient
    And the recipient should receive a notification with instructions to accept the key
    And upon acceptance, the recipient should have access to the digital key in their wallet

  Scenario: Attempt to share a digital key without an internet connection
    Given the user has a valid Digital Key
    And the user does not have an active internet connection
    When the user tries to share the digital key
    Then the system should display an error message stating "Internet connection required to share the key."
    And the digital key should not be shared

  Scenario: Attempt to share a digital key with an unsupported device
    Given the user has a valid Digital Key
    And the recipient’s device does not support digital key storage
    When the user tries to share the digital key
    Then the system should display an error message stating, "Recipient's device is not supported."
    And the digital key should not be shared
  
  Scenario: Recipient declines the shared digital key
    Given the user has sent a digital key sharing request
    And the recipient receives the invitation
    When the recipient declines the request
    Then the digital key should not be added to the recipient's wallet
    And the sender should receive a notification that the request was declined

