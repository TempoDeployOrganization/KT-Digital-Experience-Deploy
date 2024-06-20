@IsTest
    // Inner class to represent an item in the inventory
    // Inner class to represent an item in the inventory
    // Inner class to represent an item in the inventory

public class InventoryTest {
    @IsTest
    static void testAddItem() {
        Inventory inventory = new Inventory();
        inventory.addItem('Laptop', 10);
        inventory.addItem('Mouse', 5);

        // Verify quantities
        System.assertEquals(10, inventory.getItemQuantity('Laptop'));
        System.assertEquals(5, inventory.getItemQuantity('Mouse'));

        // Add more of the same item
        inventory.addItem('Laptop', 5);
        System.assertEquals(15, inventory.getItemQuantity('Laptop'));
    }

    @IsTest
    static void testRemoveItem() {
        Inventory inventory = new Inventory();
        inventory.addItem('Laptop', 10);
        inventory.removeItem('Laptop', 5);

        // Verify quantity after removal
        System.assertEquals(5, inventory.getItemQuantity('Laptop'));

        // Attempt to remove more than in stock
        try {
            inventory.removeItem('Laptop', 10);
            System.assert(false, 'Expected exception not thrown');
        } catch (Exception e) {
            System.assertEquals('Not enough items in stock to remove', e.getMessage());
        }

        // Remove remaining items
        inventory.removeItem('Laptop', 5);
        System.assertEquals(0, inventory.getItemQuantity('Laptop'));

        // Attempt to remove an item that does not exist
        try {
            inventory.removeItem('Mouse', 1);
            System.assert(false, 'Expected exception not thrown');
        } catch (Exception e) {
            System.assertEquals('Item does not exist in inventory', e.getMessage());
        }
    }

    @IsTest
    static void testGetItemQuantity() {
        Inventory inventory = new Inventory();
        inventory.addItem('Laptop', 10);

        // Verify item quantity
        System.assertEquals(10, inventory.getItemQuantity('Laptop'));

        // Verify quantity for item not in inventory
        System.assertEquals(0, inventory.getItemQuantity('Mouse'));
    }

    @IsTest
    static void testGetAllItems() {
        Inventory inventory = new Inventory();
        inventory.addItem('Laptop', 10);
        inventory.addItem('Mouse', 5);

        // Verify all items in inventory
        List<Inventory.Item> allItems = inventory.getAllItems();
        System.assertEquals(2, allItems.size());

        Map<String, Integer> expectedItems = new Map<String, Integer>{
            'Laptop' => 10,
            'Mouse' => 5
        };

        for (Inventory.Item item : allItems) {
            System.assertEquals(expectedItems.get(item.name), item.quantity);
        }
    }
}