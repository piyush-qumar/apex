public with sharing class queryClass {
    private static queryClass instance;
    public static queryClass getInstance()
    {
        if(instance==null)
        {
            instance =new queryClass();
        }
        return instance;
    }
    
    public List<SObject> customQueryChildWithParentFields(String childObjectName, String parentObjectName, String childFields, String parentFields, String childRecordId) {
        String query = 'SELECT ' + childFields + ', ' + parentFields + ' FROM ' + childObjectName +
            ' WHERE Id = \'' + childRecordId + '\'';
        System.debug(query);
        
        String parentRelationshipName = childObjectName + '__r';
        System.debug('parentRelationshipName = '+parentRelationshipName);
        String[] parentRelationshipNames = parentRelationshipName.split('__');
        System.debug('parentRelationshipNames = '+parentRelationshipNames);
        for (Integer i = 0; i < parentRelationshipNames.size() - 1; i++) {
            parentRelationshipName = parentRelationshipNames[i] + '.' + parentRelationshipNames[i+1] + '__r';
            System.debug('parentRelationshipName = '+parentRelationshipName);
        }
        String res=query.replace(parentObjectName + '__r', parentRelationshipName);
        query = query.replace(parentObjectName + '__r', parentRelationshipName);
        System.debug('query = '+query);
        
        List<SObject> queryResults = Database.query(query); 
        return queryResults;
    }
    public List<SObject> queryChildWithParentFields(String childObjectName, String parentObjectName, String childFields, String parentFields, String childRecordId) {
        String query = 'SELECT ' + childFields + ', ' + parentFields + ' FROM ' + childObjectName +
            ' WHERE Id = \'' + childRecordId + '\'';
        System.debug(query);
        
        String parentRelationshipName = childObjectName + '.' + parentObjectName;
        System.debug('parentRelationshipName = ' + parentRelationshipName);
        
        String res = query.replace(parentObjectName, parentRelationshipName);
        query = query.replace(parentObjectName, parentRelationshipName);
        System.debug('query = ' + query);
        
        List<SObject> queryResults = Database.query(query); 
        return queryResults;
    }
    
    public void customQueryParentWithChildFields(String parentObjectName, String childObjectName, String parentFields, String childFields, String parentRecordId) {
        
        String query = 'SELECT ' + parentFields + ', (SELECT ' + childFields + ' FROM ' + childObjectName + ') FROM ' + parentObjectName +
            ' WHERE Id = \'' + parentRecordId + '\'';
        System.debug(query);
        
        //String childRelationshipName = childObjectName + 's';
        String childRelationshipName = childObjectName;
        //System.debug('childRelationshipName = '+childRelationshipName);
        String[] childRelationshipNames = childRelationshipName.split('__');
        childRelationshipName = childRelationshipNames[0] +'s'+ '__r';
        System.debug('childRelationshipName = '+childRelationshipName);
        query = query.replace(childObjectName , childRelationshipName);
        System.debug('query = '+query);
        
        SObject queryResults = Database.query(query); 
        System.debug('queryResults = '+queryResults);
        //System.debug(queryResults + ' ' + queryResults.getSObject(childObjectName));
        //System.debug(queryResults.get('College__r.Address__c'));
        
    }    
    public void queryParentWithChildFields(String parentObjectName, String childObjectName, String parentFields, String childFields, String parentRecordId) {
        
        String query = 'SELECT ' + parentFields + ', (SELECT ' + childFields + ' FROM ' + childObjectName + ') FROM ' + parentObjectName +
            ' WHERE Id = \'' + parentRecordId + '\'';
        System.debug(query);
        
        String childRelationshipName = childObjectName + 's';
        System.debug('childRelationshipName = '+childRelationshipName);
        query = query.replace(childObjectName , childRelationshipName);
        System.debug('query = '+query);
        
        List<SObject> queryResults = Database.query(query); 
        System.debug('queryResults = '+queryResults);
        
    }
    
}