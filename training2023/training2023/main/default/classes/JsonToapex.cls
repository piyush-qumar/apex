
public with sharing class JsonToapex {
    public class Person
{
    public String Name;
    public String email;
    public String phone;
    public String address;
}
public Person Person;

    private static JsonToapex instance;
    public static JsonToapex getInstance() {
        if (instance == null) {
            instance = new JsonToapex();
        }
        return instance;
    }
    public Person deserializePerson(String jsonstring) {
        Person person = (Person)JSON.deserialize(jsonstring, Person.class);
        return person;
    }
}