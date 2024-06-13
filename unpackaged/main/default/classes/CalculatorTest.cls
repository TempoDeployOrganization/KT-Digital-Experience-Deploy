@isTest
public class CalculatorTest {
    @isTest
    static void testAddNumbers() {
        // Datos de prueba
        Integer num1 = 5;
        Integer num2 = 10;

        // Llamar al método a probar
        Integer result = Calculator.addNumbers(num1, num2);

        // Realizar las afirmaciones (assertions)
        System.assertEquals(15, result, 'La suma de 5 y 10 debe ser 15');
    }
}