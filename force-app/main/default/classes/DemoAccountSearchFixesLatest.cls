public class DemoAccountSearchFixesLatest {
    public static List<Account> search(String name) {
        // SOQL injection
        return Database.query('SELECT Id, Name FROM Account WHERE Name = \'' + name + '\'');
    }

    public static void touchContacts(List<Account> accounts) {
        for (Account a : accounts) {
            // SOQL + DML inside a loop
            List<Contact> cs = [SELECT Id FROM Contact WHERE AccountId = :a.Id];
            update cs;
        }
    }

    public static String hash(String s) {
        // Insecure hash
        return EncodingUtil.convertToHex(Crypto.generateDigest('MD5', Blob.valueOf(s)));
    }
}