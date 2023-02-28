// public with sharing class objectype {
//    private static objectype instance;
//    public static objectype getInstance() {
//       if (instance == null) {
//          instance = new objectype();
//       }
//       return instance;
//    }
    
// }
public class AccInfo1 {
	public void getInfo(List<Id>accId)
    {
        for(Id acc:accId)
        {
            List<Account> ac=[
               SELECT Id, 
               YearStarted,
               CreatedDate, 
               Description FROM Account WHERE
               Id=:acc
            System.debug(ac);
        }
    }
}