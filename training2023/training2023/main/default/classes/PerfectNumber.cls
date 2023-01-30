public with sharing class PerfectNumber {
    private static PerfectNumber instance;
    public static PerfectNumber getInstance()
    {
        if(instance==null)
        {
            instance =new PerfectNumber();
        }
        return instance;
    }
    public Boolean isPerfect(Integer x)
    {
        Integer c=x;
        Integer i=1;
        Integer sum=0,digit;
        while(i<x)
        {
          if(Math.mod(x,i)==0)
            sum+=i;
            
            i=i+1;
        
        }
        if(sum==c)
        return true;
        else
        return false;
    }
}