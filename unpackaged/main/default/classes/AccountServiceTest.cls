@isTest
private class AccountServiceTest {
    
    @isTest
    static void testQueryInsideLoop() {
        
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;
        
        Test.startTest();
        AccountService.queryInsideLoop();
        Test.stopTest();
        
        System.assertEquals(1, Limits.getQueries());
    }
    
    @isTest
    static void testDMLInsideLoop() {
        
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;
        
        Test.startTest();
        AccountService.dmlInsideLoop();
        Test.stopTest();
        
        System.assertEquals(1, Limits.getDmlStatements());
    }    
    
    @isTest
    static void testSOQLInjection() {
        
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        
        Test.startTest();
        AccountService.soqlInjection('\' OR Id != null');
        Test.stopTest();
        
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = 'Test Account' OR Id != null];
        System.assertEquals(accounts.size(), Limits.getQueries());
    }
    
    static void testSOQLInjectionWithoutTestAnnotation() {
        
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;        
       
        AccountService.soqlInjection('\' OR Id != null');       
        
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = 'Test Account' OR Id != null];
        System.assertEquals(accounts.size(), Limits.getQueries());
    }
    
    
}