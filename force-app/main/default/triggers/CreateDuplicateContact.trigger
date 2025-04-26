trigger CreateDuplicateContact on Contact (before insert) {
    // Set to hold the LastName values of the new contacts being inserted
    Set<String> lastNames = new Set<String>();

    // Collect the LastNames from the new contacts
    for (Contact newContact : Trigger.new) {
        if (newContact.LastName != null) {
            lastNames.add(newContact.LastName);
        }
    }
    // Query existing contacts with the same LastName
    Map<String, Contact> existingContactsMap = new Map<String, Contact>(
        [SELECT LastName FROM Contact WHERE LastName IN :lastNames]
    );

    // Loop through the new contacts being inserted
    for (Contact newContact : Trigger.new) {
        // Check if the LastName already exists
        if (existingContactsMap.containsKey(newContact.LastName)) {
            // If a contact with the same LastName exists, create a "duplicate" name
            newContact.LastName = 'duplicate_' + newContact.LastName;
        }
    }
}