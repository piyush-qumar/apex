public with sharing class taskMajor {
    public static String fetchObjectDetails(String objname,List<String> nm) {
        Map<String, Object> objectData = new Map<String, Object>();
        String fields = String.join(',', nm);
        
       // List<SObject> records = Database.query('SELECT ' + fields + ' FROM ' + objName);
      
        List<Account> accounts = Database.query('SELECT ' + fields + ' FROM ' + Account);
        for (Account a : accounts) {

        }
            //objectData.put(a.Name, a.AnnualRevenue);
        
        Map<String, Object> resultData = new Map<String, Object>();
        for (String fieldName : nm) {
            if (objectData.containsKey(fieldName)) {
                resultData.put(fieldName, objectData.get(fieldName));
            }
        }
        
        return JSON.serialize(resultData);
        
    }
}