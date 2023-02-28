// public with sharing class TestSh1 {
//     public TestSh1() {

//     }
// }

/**
* ─────────────────────────────────────────────────────────────────────────────────────────────────┐
* ICRemoteSiteHandler
* @description    This is a main class to handle addition of remote site 
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @author         Prashant Raj
* @modifiedBy     Aaqib Javed
* @maintainedBy   Chandan Panigrahy
* @version        1.0
* @created        2022-07-18
* @modified       
* ──────────────────────────────────────────────────────────────────────────────────────────────────
* @changes
* vX.X            Prashant Raj
* 2023-01-17      Code Redesign and Remove Queueable.
*
* ─────────────────────────────────────────────────────────────────────────────────────────────────┘
**/
public with sharing class TestSh1 {
    
    @AuraEnabled
    public static Integer execute(List<String> endpoints){ 
        List<String> endpointList = new List<String> ();
        for(String endpointData : endPoints.get(0).split('/')) { 
            if(String.isBlank(endpointData)) {
                endpointData = '//';
            }
            endpointList.add(endpointData);  
        }
        String remotesiteValue = endpointList.get(0) + endpointList.get(1) + endpointList.get(2);
        List<String> remotesiteNameList = new List<String>();
        String domainName = '';
        
        for(String eachData : endpointList.get(2).split('\\.')) {
            remotesiteNameList.add(eachData);
        }
        if(remotesiteNameList.size() >= 3) {
            domainName = domainName+ remotesiteNameList.get(1); 
        }
        if(remotesiteNameList.size() < 3) {
            domainName = domainName+ remotesiteNameList.get(0); 
        }      
        String description 						= domainName + 'is the remote site for the API';
        Boolean isActive 						= TRUE;
        Boolean disableProtocolSetting 			= FALSE;
        String endpoint = URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v{0}/tooling/sobjects/RemoteProxy/';
     
        ApexClass apexCls = [SELECT Id, ApiVersion FROM ApexClass WITH SECURITY_ENFORCED ORDER BY ApiVersion DESC LIMIT 1];
        List<String> dataList = new List<String>();
        dataList.add(String.valueOf(apexCls.ApiVersion));
        endpoint = String.format(endpoint, dataList);
        String baseJsonBody = '{\"FullName\":siteNameValue,\"Metadata\":{\"disableProtocolSecurity\":disableValue,\"isActive\":activeValue,\"url\":urlValue,\"description\":descValue}}';
        String finalJson = baseJsonBody.Replace('disableValue',''+disableProtocolSetting).Replace('activeValue',''+isActive).Replace('siteNameValue','\"'+domainName+'\"').Replace('urlValue','\"'+remotesiteValue+'\"').Replace('descValue','\"'+description+'\"');
        String jsonBody = finalJson;
        String sessionId = System.Test.isRunningTest()? 'kjadshfk' :TestSh1.getSessionIdFromVFPage();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setHeader('Authorization', 'Bearer ' + sessionId); //UserInfo.getSessionId().substring(15));
        request.setHeader('Content-Type', 'application/json');
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setBody(jsonBody);
        HttpResponse response = http.send(request); 
        Integer statusCode = response.getStatusCode();
        
        return response.getStatusCode();
    }
    
    private static String getSessionIdFromVFPage(){
        PageReference pg = new PageReference('/apex/restApiSessionId');
        String content = pg.getContent().toString();
        Integer s = content.indexOf('Start') + 'Start_Of_Session_Id'.length(),
            e = content.indexOf('End');
        System.debug(content.substring(s, e));
        return content.substring(s, e);
    }
}