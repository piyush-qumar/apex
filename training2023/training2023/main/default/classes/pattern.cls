public with sharing class pattern {
    private static pattern instance;
    public static pattern getInstance() {
        if (instance == null) {
            instance = new pattern();
        }
        return instance;
    }
    public String patmat(String str, String input)
    {
        Pattern pattern = Pattern.compile('"name"');
        Matcher matcher = pattern.matcher(input);
        if(matcher.find()){
            str= matcher.replaceFirst('"'+input+'"');
            System.debug('str'+str);
        }

        return str;
    }
}