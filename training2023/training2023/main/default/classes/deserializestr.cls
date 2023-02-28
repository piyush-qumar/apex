public with sharing class deserializestr {
    private static deserializestr instance;
    public static deserializestr getInstance() {
        if(instance == null)
            instance = new deserializestr();
        return instance;
    }
    public List<Map<String, Object>> parse(String jsonString) {
        List<Map<String, Object>> result = new List<Map<String, Object>>();
        try {
            // Map<String, Object> json = (Map<String, Object>)JSON.deserializeUntyped(jsonString);
            Map<String, Object> jso = (Map<String, Object>)JSON.deserializeStrict(jsonString,deserializestr.class);


            List<Object> records = (List<Object>)jso.get('records');
            for (Object record : records) {
                result.add((Map<String, Object>)record);
            }
       } 
        catch (System.JSONException e) {
            System.debug('Error parsing JSON: ' + e.getMessage());
        }
        
        System.debug(result);
        return result;
    }
}