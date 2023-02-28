// public with sharing class validation {
//     private static validation instance;
//     public static validation getInstance()
//     {
//         if(instance==null)
//         {
//             instance =new validation();
//         }
//         return instance;
//     }
//     public Boolean upsertRecord(String objectName, String jsonString)
//     {
//         SObject instance=null;
       
//         Boolean result=false;
//         Map<String, Object> recordData = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
//         System.Type resHandler = System.Type.forName(objectName);
//         instance = resHandler.newSObject();
//         for(String key : recordData.keySet()) {
//             Object value = recordData.get(key);
//             instance.put(key,value);
//         }
//         try{
//             upsert instance;
//             result=true;
//         }
//         catch(Exception e){
//             result=false;
//         }
            
//         return result;

//     }
// }
public class testDataFactory {
    public static void createAdminUser() {
        List<User> adminUser = ICTestDataFactoryUser.createAdminUser(1);
        INSERT adminUser;
         ICTestDataFactoryUser.assignAdminPermission(adminUser.get(0).Id);

    }
        
        public static List<Data_Source_Item__c> createDataSourceItems(Data_Source__c dataSource) {	
            List<Data_Source_Item__c> dataSourceItems = new List<Data_Source_Item__c>();
            dataSourceItems.add(new Data_Source_Item__c(
                Handler_Name__c = 'SELECT Id,Name FROM Account WHERE Id = \'$RecordId\'',
                Type__c = 'Query',
                Data_Source__c = dataSource.Id,
                Name = 'Demo_DS_Item4',
                Order__c = 1
            ));
            dataSourceItems.add(new Data_Source_Item__c(
            Handler_Name__c = 'Account',
            Type__c = 'Object',
            Parameters__c = 'Id,Name',
            Data_Source__c = dataSource.Id,
            Name = 'Demo_DS_Item1',
            Order__c = 2
        ));
        dataSourceItems.add(new Data_Source_Item__c(
            Handler_Name__c = '/services/data/v54.0/sobjects/Account',
            Type__c = 'Rest Service',
            Data_Source__c = dataSource.Id,
            Name = 'Demo_DS_Item2',
            Order__c = 3
        ));
        dataSourceItems.add(new Data_Source_Item__c(
            Handler_Name__c = '{"company":"Ceptes"}',
            Type__c = 'Custom Json',
            Data_Source__c = dataSource.Id,
            Name = 'Demo_DS_Item3',
            Order__c = 4
        ));
            dataSourceItems.add(new Data_Source_Item__c(
            Handler_Name__c = 'DemoClass',
            Type__c = 'Apex Class',
            Data_Source__c = dataSource.Id,
            Name = 'Demo_DS_Item5',
            Order__c = 5
        ));
        return dataSourceItems;
        }
    
      public static List<Transformation_Source_Item__c> createTransformSourceItems(Transformation_source__c transformSource) {	
            List<Transformation_Source_Item__c> transformSourceItems = new List<Transformation_Source_Item__c>();
            transformSourceItems.add(new Transformation_Source_Item__c(
                Name = 'Riz transformer',
                API_Name__c = 'Riz transformer',
                Mapper_JSON__c = '{"Hii":[{"attributes":{"type":"/1[1]/Name","url":"/services/data/v55.0/sobjects/Account/0011k000012ZxaOAAS"},"Id":"0011k000012ZxaOAAS","Name":"/1[1]/Name"},{"attributes":{"type":"Account","url":"/services/data/v55.0/sobjects/Account/0011k000012TLUjAAO"},"Id":"0011k000012TLUjAAO","Name":"Sample Account for Entitlements"}]}'
                //Transformation_Source__c = transformer.Id
            ));
    return transformSourceItems;
}
 public static List
    
}