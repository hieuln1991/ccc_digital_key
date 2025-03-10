Feature: Store Digital Key in Apple Wallet / Google Wallet

  Scenario: Successfully store a digital key in Apple Wallet or Google Wallet
    Given the user has a valid Digital Key
    And the user has a compatible smartphone with Apple Wallet or Google Wallet installed
    When the user selects the option to store the digital key in the wallet
    Then the system should prompt for authentication (e.g., Face ID, Touch ID, or PIN)
    And upon successful authentication, the digital key should be stored in the wallet
    And the wallet should display the Digital Key with relevant details
    And the user should be able to view the stored key in the wallet app

  Scenario: User attempts to store a key on an unsupported device
    Given the user has a valid Digital Key
    And the user has a smartphone that does not support Apple Wallet or Google Wallet
    When the user tries to store the digital key in the wallet
    Then the system should display an error message stating "Digital Key storage is not supported on this device"
    And the digital key should not be stored

  Scenario: Authentication failure while storing the key
    Given the user has a valid Digital Key
    And the user has a compatible smartphone with Apple Wallet or Google Wallet installed
    When the user selects the option to store the digital key in the wallet
    And authentication fails due to an incorrect Face ID, Touch ID, or PIN
    Then the system should display an authentication failure message
    And the digital key should not be stored in the wallet
