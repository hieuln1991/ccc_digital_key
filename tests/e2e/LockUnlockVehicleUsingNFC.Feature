Feature: Lock/Unlock Vehicle Using NFC

  Scenario: Successfully unlock the vehicle using NFC
    Given the user has a valid Digital Key stored in Apple Wallet or Google Wallet
    And the user's smartphone has NFC enabled
    And the user is near the vehicle
    When the user taps their smartphone on the vehicle’s NFC reader
    Then the system should authenticate the digital key
    And the vehicle should unlock
    And the user should hear an unlock confirmation sound
    And the vehicle's lights should flash as a confirmation signal

  Scenario: Successfully lock the vehicle using NFC
    Given the user has a valid Digital Key stored in Apple Wallet or Google Wallet
    And the user's smartphone has NFC enabled
    And the vehicle is currently unlocked
    When the user taps their smartphone on the vehicle’s NFC reader
    Then the system should authenticate the digital key
    And the vehicle should lock
    And the user should hear a lock confirmation sound
    And the vehicle's lights should flash as a confirmation signal

Scenario: Attempt to lock/unlock the vehicle with NFC disabled
    Given the user has a valid Digital Key stored in Apple Wallet or Google Wallet
    But the user's smartphone has NFC disabled
    When the user taps their smartphone on the vehicle’s NFC reader
    Then the system should display a message stating "Please enable NFC to use the Digital Key"
    And the vehicle should not lock or unlock

Scenario: Attempt to lock/unlock the vehicle with an expired digital key
    Given the user has a Digital Key stored in Apple Wallet or Google Wallet
    But the digital key has expired
    When the user taps their smartphone on the vehicle’s NFC reader
    Then the system should display a message stating "Digital Key expired. Please renew or reconfigure your key"
    And the vehicle should not lock or unlock

Scenario: Attempt to unlock the vehicle with an unregistered device
    Given the vehicle is equipped with NFC-based digital key access
    But the user's smartphone does not have a registered Digital Key
    When the user taps their smartphone on the vehicle’s NFC reader
    Then the system should reject the authentication
    And the vehicle should remain locked
    And the system should display a message stating "No valid digital key detected"

Scenario: NFC reader failure on the vehicle
    Given the user has a valid Digital Key stored in Apple Wallet or Google Wallet
    And the user's smartphone has NFC enabled
    But the vehicle's NFC reader is malfunctioning
    When the user taps their smartphone on the vehicle’s NFC reader
    Then the system should not respond
    And the vehicle should not lock or unlock
    And the system should display a message stating "NFC reader error. Please use another method"

