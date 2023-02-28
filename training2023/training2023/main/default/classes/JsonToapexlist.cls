public with sharing class JsonToapexlist {
    private static JsonToapexlist instance;
    public static JsonToapexlist getInstance() {
        if(instance == null)
            instance = new JsonToapexlist();
        return instance;
    }
    public List<Map<String, Object>> parse(String jsonString) {
        List<Map<String, Object>> result = new List<Map<String, Object>>();
        try {
            Map<String, Object> json = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
            List<Object> records = (List<Object>)json.get('records');
            for (Object record : records) {
                result.add((Map<String, Object>)record);
            }
       } 
        catch (System.JSONException e) {
            System.debug('Error parsing JSON: ' + e.getMessage());
        }
        return result;
    }
}
