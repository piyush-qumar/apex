@isTest
private class JsonToapexTest {
    static testMethod void deserializePersonTest() {
        JsonToapex jsonToApex = JsonToapex.getInstance();
        String jsonString = '{"name":"John Doe","email":"john.doe@example.com","phone":"555-555-1212","address":"123 Main St"}';
        JsonToapex.Person person = jsonToApex.deserializePerson(jsonString);
        System.assertEquals('John Doe', person.name);
        System.assertEquals('john.doe@example.com', person.email);
        System.assertEquals('555-555-1212', person.phone);
        System.assertEquals('123 Main St', person.address);
    }
}
