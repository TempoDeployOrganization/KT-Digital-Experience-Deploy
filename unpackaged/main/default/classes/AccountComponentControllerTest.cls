@isTest
public class AccountComponentControllerTest {
    
    @isTest
    static void testAccountComponentController() {
        // Create test data
        Account testAccount1 = new Account(Name = 'Test Account 1', Phone = '1234567890', Industry = 'Technology');
        insert testAccount1;

        // Instantiate the controller
        AccountComponentController controller = new AccountComponentController();

        // Verify initial state
        System.assertNotEquals(controller.accounts, null, 'Accounts list should not be null');
        System.assert(controller.accounts.size() > 0, 'Accounts list should contain records');
        System.assertEquals(controller.newAccount.Name, null, 'New account name should be null initially');

        // Set up a new account
        controller.newAccount.Name = 'New Test Account';
        controller.newAccount.Phone = '0987654321';
        controller.newAccount.Industry = 'Finance';

        // Save the new account
        Test.startTest();
        controller.saveAccount();
        Test.stopTest();

        // Verify the new account was created
        List<Account> accounts = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name = 'New Test Account'];
        System.assertEquals(1, accounts.size(), 'There should be one new account created');
        System.assertEquals('New Test Account', accounts[0].Name, 'The new account name should be "New Test Account"');
        System.assertEquals('0987654321', accounts[0].Phone, 'The new account phone should be "0987654321"');
        System.assertEquals('Finance', accounts[0].Industry, 'The new account industry should be "Finance"');

        // Verify the controller state after save
        System.assert(controller.newAccount.Name == null, 'New account should be reset after save');
        System.assert(controller.accounts.size() > 1, 'Accounts list should be refreshed and contain more than one account');
    }

    @isTest
    static void testSaveAccountError() {
        // Instantiate the controller
        AccountComponentController controller = new AccountComponentController();

        // Set up a new account with invalid data (missing required fields)
        controller.newAccount = new Account();

        // Save the new account
        Test.startTest();
        controller.saveAccount();
        Test.stopTest();

        // Verify error message
        List<ApexPages.Message> messages = ApexPages.getMessages();
        System.assert(messages.size() > 0, 'There should be at least one error message');
        System.assertEquals(ApexPages.Severity.ERROR, messages[0].getSeverity(), 'The message severity should be ERROR');
    }
}