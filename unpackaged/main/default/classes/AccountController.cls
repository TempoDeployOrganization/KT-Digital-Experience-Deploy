public class AccountController {
    public List<Account> accounts { get; set; }
    public Account newAccount { get; set; }

    public AccountController() {
        accounts = [SELECT Id, Name, Phone, Industry FROM Account];
        newAccount = new Account();
    }

    public PageReference saveAccount() {
        try {
            insert newAccount;
            // Refresh the account list to include the new account
            accounts = [SELECT Id, Name, Phone, Industry FROM Account];
            newAccount = new Account(); // Reset the form
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Account created successfully!'));
        } catch (DmlException e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Error creating account: ' + e.getMessage()));
        }
        return null;
    }
}