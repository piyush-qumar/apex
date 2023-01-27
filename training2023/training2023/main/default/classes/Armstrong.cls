public with sharing class Armstrong {
  private static Armstrong instance;
  public static Armstrong getInstance()
  {
    if(instance==null){
    instance=new Armstrong();
  }
  return instance;
}
public Boolean isArmstrong(Integer x)
{
    Integer c=x;
    Integer sum,result=0,digit;

    while (x>0) {
        digit=Math.mod(x,10);
        result+=digit*digit*digit;
        x=x/10;
    }
    if(result==c)
    return true;
    else
    return false;
}
}