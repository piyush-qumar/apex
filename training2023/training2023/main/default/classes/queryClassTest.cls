@isTest
private class queryClassTest {

    @isTest
    static void testCustomQueryChildWithParentFields() {
        Account parentAccount = new Account(Name='Test Account');
        insert parentAccount;
        
        Contact childContact = new Contact(FirstName='Test', LastName='Contact', AccountId=parentAccount.Id);
        insert childContact;
        
        List<SObject> results = queryClass.getInstance().customQueryChildWithParentFields(
            'Contact', 'Account', 'Id, FirstName, LastName', 'Id, Name', childContact.Id);
        
        System.assertEquals(1, results.size());
        Contact queriedContact = (Contact) results.get(0);
        System.assertEquals(childContact.Id, queriedContact.Id);
        System.assertEquals('Test', queriedContact.FirstName);
        System.assertEquals('Contact', queriedContact.LastName);
        System.assertEquals(parentAccount.Id, queriedContact.AccountId);
        System.assertEquals(parentAccount.Name, queriedContact.Account.Name);
    }
    
    @isTest
    static void testQueryChildWithParentFields() {
        Account parentAccount = new Account(Name='Test Account');
        insert parentAccount;
        
        Contact childContact = new Contact(FirstName='Test', LastName='Contact', AccountId=parentAccount.Id);
        insert childContact;
        
        List<SObject> results = queryClass.getInstance().queryChildWithParentFields(
            'Contact', 'Account', 'Id, FirstName, LastName', 'Id, Name', childContact.Id);
        
        System.assertEquals(1, results.size());
        Contact queriedContact = (Contact) results.get(0);
        System.assertEquals(childContact.Id, queriedContact.Id);
        System.assertEquals('Test', queriedContact.FirstName);
        System.assertEquals('Contact', queriedContact.LastName);
        System.assertEquals(parentAccount.Id, queriedContact.AccountId);
        System.assertEquals(parentAccount.Name, queriedContact.Account.Name);
    }
    
    @isTest
    static void testCustomQueryParentWithChildFields() {
        Account parentAccount = new Account(Name='Test Account');
        insert parentAccount;
        
        Contact childContact = new Contact(FirstName='Test', LastName='Contact', AccountId=parentAccount.Id);
        insert childContact;
        
        Test.startTest();
        queryClass.getInstance().customQueryParentWithChildFields(
            'Account', 'Contact', 'Id, Name', 'Id, FirstName, LastName', parentAccount.Id);
        Test.stopTest();
        
        // No assertion as this method doesn't return anything
    }
    
    @isTest
    static void testQueryParentWithChildFields() {
        Account parentAccount = new Account(Name='Test Account');
        insert parentAccount;
        
        Contact childContact = new Contact(FirstName='Test', LastName='Contact', AccountId=parentAccount.Id);
        insert childContact;
        
        List<SObject> results = queryClass.getInstance().queryParentWithChildFields(
            'Account', 'Contact', 'Id, Name', 'Id, FirstName, LastName', parentAccount.Id);
        
        System.assertEquals(1, results.size());
        Account queriedAccount = (Account) results.get(0);
        System.assertEquals(parentAccount.Id, queriedAccount.Id);
        System.assertEquals(parentAccount.Name, queriedAccount.Name);
        System.assertEquals(1, queriedAccount.Contacts.size());
        Contact queriedContact = (Contact) queriedAccount.Contacts.get(0);
        System.assertEquals(childContact.Id, queriedContact.Id);
        System.assertEquals('Test', queriedContact.FirstName);
        System.assertEquals('Contact', queriedContact.LastName);
        System.assertEquals(parentAccount.Id, queriedContact.AccountId);
        System.assertEquals(parentAccount.Name, queriedContact.Account.Name);
    }
}
