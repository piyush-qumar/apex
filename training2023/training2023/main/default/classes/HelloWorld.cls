public with sharing class HelloWorld {
  private static HelloWorld instance;
  public static HelloWorld getInstance(){
    if(instance == null){
      instance = new HelloWorld();
    }
    return instance;
  }
  public String getMessage()
    {
        return 'Hello World';
    }
}