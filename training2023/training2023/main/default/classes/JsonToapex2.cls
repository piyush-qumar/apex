public with sharing class JsonToapex2{
private static JsonToapex2 instance;
public static JsonToapex2 getInstance() {
if (instance == null) {
instance = new JsonToapex2();
}
return instance;
}
public Map<String, Object> parse(String jsonStrings) {

    String jsonString = '{"person": {"name": "John", "age": 30, "address": {"street": "123 Main St", "city": "San Francisco"}}}';

Map<String, Object> result = JsonToapex2.getInstance().parse(jsonString);
Map<String, Object> person = (Map<String, Object>) result.get('person');

String name = (String) person.get('name');
Integer age = (Integer) person.get('age');
Map<String, Object> address = (Map<String, Object>) person.get('address');
String street = (String) address.get('street'); 
String city = (String) address.get('city');

    return (Map<String, Object>) JSON.deserializeUntyped(jsonString);
}




}


