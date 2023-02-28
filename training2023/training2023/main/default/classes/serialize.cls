public with sharing class serialize {
    public class Person implements Serializable{
        public String name;
        public String email;
        public String phone;
        public String address;
    }
   private static serialize instance;
    public static serialize getInstance() {
        if (instance == null) {
            instance = new serialize();
        }
        return instance;
    }
    public String serializeObject(Person obj) {
       
        String serializedString = JSON.serialize(obj);
        return serializedString;
    }
}
