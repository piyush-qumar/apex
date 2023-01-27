public with sharing class Pallindrome {
   private static Pallindrome instance;
   private Pallindrome getInstance()
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
          reverse = reverse + input.charAt(i);
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