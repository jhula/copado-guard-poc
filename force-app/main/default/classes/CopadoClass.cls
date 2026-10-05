public class CopadoClass {
    // main run class
    public static void run(List<Id> ids) {
        for (Id i : ids) {
            Contact c = [SELECT Id, LastName, FirstName FROM Contact WHERE Id = :i];
            c.LastName = c.LastName + ' x'; 
            // this will do the update
            update c;
        }
    }
}