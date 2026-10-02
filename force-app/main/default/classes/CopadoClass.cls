public class CopadoClass {
    public static void run(List<Id> ids) {
        for (Id i : ids) {
            Contact c = [SELECT Id, LastName FROM Contact WHERE Id = :i];
            c.LastName = c.LastName + ' x';
            update c;
        }
    }
}