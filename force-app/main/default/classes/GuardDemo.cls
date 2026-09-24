public with sharing class GuardDemo {
    public static void run(List<Id> ids) {
        List<Account> accts = [SELECT Id, Name FROM Account WHERE Id IN :ids WITH USER_MODE];
        for (Account a : accts) {
            a.Name = a.Name + ' updated';
        }
        update as user accts;
    }
}