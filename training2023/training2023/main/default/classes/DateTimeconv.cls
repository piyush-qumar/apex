public with sharing class DateTimeconv {
    private static DateTimeconv instance;
    public static DateTimeconv getInstance()
    {
        if(instance==null)
        {
            instance =new DateTimeconv();
        }
        return instance;
    }
    public Datetime findTime(Integer millisec)
    {
        Datetime dt = Datetime.newInstance(2023, 1, 1, 0, 0, 0);
        dt.addSeconds(millisec);
        return dt;
    }
}