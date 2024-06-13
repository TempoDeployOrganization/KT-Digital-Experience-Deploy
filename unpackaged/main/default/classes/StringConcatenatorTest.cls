@isTest
public class StringConcatenatorTest {
    @isTest
    static void testConcatenateStrings() {
        // Datos de prueba
        String str1 = 'Hello, ';
        String str2 = 'World!';

        // Llamar al método a probar
        String result = StringConcatenator.concatenateStrings(str1, str2);

        // Realizar las afirmaciones (assertions)
        System.assertEquals('Hello, World!', result, 'La concatenación de "Hello, " y "World!" debe ser "Hello, World!"');
    }
}