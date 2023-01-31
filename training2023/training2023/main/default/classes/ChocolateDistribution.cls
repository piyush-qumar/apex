public with sharing class ChocolateDistribution {
   private static ChocolateDistribution instance;
   public static ChocolateDistribution getInstance()
   {
    if(instance==null){
    instance=new ChocolateDistribution();}
    return instance;
   }
   public static Long ChocoTreat(List<Long> a,Long n,Long m)
   {
      a.sort();
      Long maxi=1000000000L;
      Long l=0;
      Long r=m-1;
      while(r<n)
      {
         Long diff=Long.valueOf((Long)a.get(r)) -Long.valueOf((Long)a.get(l)) ;
         if(maxi>diff)
         {
            maxi=diff;
         }
         l=l+1;
         r=r+1;
      }
      return maxi;

   }
}