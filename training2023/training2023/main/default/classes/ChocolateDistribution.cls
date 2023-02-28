public with sharing class ChocolateDistribution {
   private static ChocolateDistribution instance;
   public static ChocolateDistribution getInstance()
   {
    if(instance==null){
    instance=new ChocolateDistribution();}
    return instance;
   }
   public static Long ChocoTreat(List<Long> a,Integer n,Integer m)
   {
      a.sort();
      Long maxi=1000000000L;
      Integer l=0;
      Integer r=m-1;
      while(r<n)
      {
         Long diff=a.get(r) -a.get(l) ;
         if(maxi>diff)
         {
            maxi=diff;
         }
         l=l+1;
         r=r+1;
      }
      System.debug('maxi'+maxi);
      return maxi;

   }
}