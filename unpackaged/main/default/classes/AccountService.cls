public class AccountService {
    
    String accountName, accountIndustry, accountPhone;
  
    public static void queryInsideLoop() {
        List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 100];
        
        for (Account acc : accounts) {
            List<Contact> contacts = [SELECT Id, Name FROM Contact WHERE AccountId = :acc.Id];           
        }
    }


    public static void dmlInsideLoop() {
        List<Account> accounts = [SELECT Id, Name FROM Account LIMIT 100];
        
        for (Account acc : accounts) {
            Contact newContact = new Contact(AccountId = acc.Id, LastName = 'Test Contact');
            insert newContact;
        }
    }
    
    public static void soqlInjection(String input) {
        String queryString = 'SELECT Id, Name FROM Account WHERE Name = \'' + input + '\'';
        List<Account> accounts = Database.query(queryString);
        
    }
    
    public static String ifElseChain(String input) {
        
        String chosenCondition = '';
        
        if ( input == 'Condition 1') {
            chosenCondition = 'Condition 1';           
        }
        else if ( input == 'Condition 2') {
            chosenCondition = 'Condition 2';   
        }
        else if ( input == 'Condition 3' ) {
            chosenCondition = 'Condition 3';   
        }
        else {
            chosenCondition = 'Condition 4';   
        }
        
        System.debug('>> Chosen condition: ' + chosenCondition);
        
        return chosenCondition;        
        
    }
    
    String accountType;
    Boolean isAccountActive;
    
}