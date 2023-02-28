public class taskFor {
    public static void hello(){
        List<String> queryList = new List<String>{
            'SELECT Id, Name FROM Account WHERE Name LIKE \'A%\'' ,
                'SELECT Id, Name FROM Contact WHERE Name LIKE \'A%\''
                };
                    String joinedQuery = String.join(queryList, ';');
        List<sObject> results = Database.query(joinedQuery);
        List<Account> accountResults = new List<Account>();
        List<Contact> contactResults = new List<Contact>();
        for (sObject record : results) {
            if (record instanceof Account) {
                accountResults.add((Account)record);
            } else if (record instanceof Contact) {
                contactResults.add((Contact)record);
            }
        }
    }
}



