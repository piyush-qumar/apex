@IsTest
private with sharing class HelloWorldTest {
    @isTest
    static void testGetMessage() {
        HelloWorld obj=HelloWorld.getInstance();
        String response=obj.getMessage();
        System.assert(String.isNotBlank(response));
        System.assert((response.equals('Hello World')));
        System.assertEquals('Hello World',response);
    }

    }
