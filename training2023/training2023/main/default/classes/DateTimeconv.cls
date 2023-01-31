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
    public Datetime findTime(Integer seconds)
    {
        Integer secsInMin = 60;
    	Integer secsInHour = secsInMin * 60;
    	Integer secsInDay = secsInHour * 24;
    	Integer secsInMonth = secsInDay * 30;
    	Integer secsInYear = secsInDay * 365;

    Integer years = seconds / secsInYear;
    seconds = Math.mod(seconds,secsInYear);

    Integer months = seconds / secsInMonth;
    seconds = Math.mod(seconds,secsInMonth);

    Integer days = seconds / secsInDay;
    seconds = Math.mod(seconds,secsInDay);

    Integer hours = seconds / secsInHour;
    seconds = Math.mod(seconds,secsInHour);

    Integer minutes = seconds / secsInMin;
    seconds = Math.mod(seconds,secsInMin);
        
        System.debug(years);
        System.debug(months);
        System.debug(days);
        System.debug(hours);
        System.debug(minutes);
        System.debug(seconds);
        
        Datetime dt = Datetime.newInstance(2023, 1, 1, 0, 0, 0);
        Integer day=dt.day()+days;
        Integer month=dt.month()+months;
        Integer year=dt.year()+years;
        Integer hour=dt.hour()+hours;
        Integer minute=dt.minute()+minutes;
        Integer second=dt.second()+seconds;
        System.debug(year+':'+month+':'+day+' '+hour+':'+minute+':'+second);
        return dt;
    }
}