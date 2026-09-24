public class GuardDemo {
    public static void run(List<Id> ids) {
        for (Id i : ids) {
            Account a = [SELECT Id, Name FROM Account WHERE Id = :i]; // SOQL in loop
            a.Name = a.Name + ' updated';
            update a; // DML in loop which is wrong
        }
    }
}