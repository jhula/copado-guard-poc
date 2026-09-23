public with sharing class AccountProcessor {
    /**
     * Updates contact descriptions based on account IDs.
     * Contains anti-patterns for static code analysis / Guard to flag:
     * - SOQL inside a for-loop (AvoidSoqlInLoops)
     * - DML inside a for-loop (AvoidDmlStatementsInLoops)
     */
    public static void updateContactsForAccounts(List<Id> accountIds) {
        if (accountIds == null || accountIds.isEmpty()) {
            return;
        }

        for (Id accId : accountIds) {
            // Anti-pattern: SOQL query inside a for-loop
            List<Contact> contacts = [
                SELECT Id, FirstName, LastName, Description 
                FROM Contact 
                WHERE AccountId = :accId
            ];

            for (Contact con : contacts) {
                con.Description = 'Updated description for Account: ' + accId;
                // Anti-pattern: DML statement inside a loop
                update con;
            }
        }
    }

    /**
     * Retrieves contacts for account names using a SOQL query inside a loop.
     * Anti-pattern: SOQL inside a for-loop (AvoidSoqlInLoops)
     */
    public static List<Contact> getContactsByAccountNames(List<String> accountNames) {
        List<Contact> allContacts = new List<Contact>();

        for (String accName : accountNames) {
            // Anti-pattern: SOQL query inside a loop
            List<Contact> contacts = [
                SELECT Id, Name, Email, Account.Name 
                FROM Contact 
                WHERE Account.Name = :accName
            ];
            allContacts.addAll(contacts);
        }

        return allContacts;
    }
}