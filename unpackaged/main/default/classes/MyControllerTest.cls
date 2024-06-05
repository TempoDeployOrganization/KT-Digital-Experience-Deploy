@isTest
public class MyControllerTest {
    // Test method for the constructor
    @isTest
    public static void testConstructor() {
        // Instancia la clase MyController
        MyController controller = new MyController();
        
        // Verifica que myVariable tenga el valor esperado
        System.assertEquals('Hello, Salesforce!', controller.myVariable);
    }
    
    // Test method for myMethod
    @isTest
    public static void testMyMethod() {
        // Instancia la clase MyController
        MyController controller = new MyController();
        
        // Llama al método myMethod
        controller.myMethod();
        
        // Agrega cualquier verificación necesaria aquí
        // Dado que el método myMethod no tiene lógica, no hay verificaciones adicionales en este caso
        // pero en una situación real, aquí es donde se verificaría el resultado de myMethod.
    }
}