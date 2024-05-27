@isTest
public class AccountControllerTest {

    @isTest
    static void testAccountControllerInitialization() {
        // Test the initialization of the AccountController
        AccountController controller = new AccountController();
        
        // Check that accounts list is initialized
        System.assertNotEquals(controller.accounts, null, 'Accounts list should be initialized');
        
        // Check that newAccount is initialized
        System.assertNotEquals(controller.newAccount, null, 'NewAccount should be initialized');
    }

    @isTest
    static void testSaveAccountSuccess() {
        // Test successful account creation
        AccountController controller = new AccountController();
        controller.newAccount.Name = 'Test Account';
        controller.newAccount.Phone = '1234567890';
        controller.newAccount.Industry = 'Technology';

        Test.startTest();
        PageReference result = controller.saveAccount();
        Test.stopTest();

        // Verify that the new account was inserted
        Account insertedAccount = [SELECT Id, Name, Phone, Industry FROM Account WHERE Name = 'Test Account' LIMIT 1];
        System.assertNotEquals(insertedAccount, null, 'Account should have been inserted');

        // Verify that the accounts list was refreshed
        System.assert(controller.accounts.size() > 0, 'Accounts list should have been refreshed');

        // Verify that the success message was added
        List<ApexPages.Message> messages = ApexPages.getMessages();
        System.assert(messages.size() > 0, 'There should be at least one message');
        System.assertEquals(ApexPages.Severity.CONFIRM, messages[0].getSeverity(), 'The message severity should be CONFIRM');
        System.assertEquals('Account created successfully!', messages[0].getSummary(), 'The message should indicate successful account creation');
    }

    @isTest
    static void testSaveAccountFailure() {
        // Test account creation failure by violating a validation rule
        AccountController controller = new AccountController();
        controller.newAccount = new Account(); // No required fields set

        Test.startTest();
        PageReference result = controller.saveAccount();
        Test.stopTest();

        // Verify that no new account was inserted
        Integer accountCount = [SELECT COUNT() FROM Account WHERE Name = null];
        System.assertEquals(0, accountCount, 'No account should have been inserted');

        // Verify that the error message was added
        List<ApexPages.Message> messages = ApexPages.getMessages();
        System.assert(messages.size() > 0, 'There should be at least one message');
        System.assertEquals(ApexPages.Severity.ERROR, messages[0].getSeverity(), 'The message severity should be ERROR');
    }
}