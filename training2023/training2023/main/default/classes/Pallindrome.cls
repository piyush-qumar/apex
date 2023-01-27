public with sharing class Pallindrome {
   private static Pallindrome instance;
   public static Pallindrome getInstance()
   {
    if(instance==null){
      instance= new Pallindrome();
    }
    return instance;
   }
   
   public Boolean isPallindrome(String input)
   {
       String reverse = '';
       for(Integer i=input.length()-1;i>=0;i--)
       {
         reverse = reverse + input.substring(i,i+1);
       }
       if(input==reverse)
       {
          return true;
       }
       else
       {
          return false;
       }
   }
}