public class Inventory {
    // Inner class to represent an item in the inventory
    public class Item {
        public String name { get; set; }
        public Integer quantity { get; set; }

        public Item(String name, Integer quantity) {
            this.name = name;
            this.quantity = quantity;
        }
    }

    private Map<String, Item> items;

    public Inventory() {
        items = new Map<String, Item>();
    }

    // Add an item to the inventory
    public void addItem(String name, Integer quantity) {
        if (items.containsKey(name)) {
            items.get(name).quantity += quantity;
        } else {
            items.put(name, new Item(name, quantity));
        }
    }

    // Remove an item from the inventory
    public void removeItem(String name, Integer quantity) {
        if (items.containsKey(name)) {
            Item item = items.get(name);
            if (item.quantity >= quantity) {
                item.quantity -= quantity;
                if (item.quantity == 0) {
                    items.remove(name);
                }
            } else {
                throw new IllegalArgumentException('Not enough items in stock to remove');
            }
        } else {
            throw new IllegalArgumentException('Item does not exist in inventory');
        }
    }

    // Get the quantity of an item in stock
    public Integer getItemQuantity(String name) {
        if (items.containsKey(name)) {
            return items.get(name).quantity;
        } else {
            return 0;
        }
    }

    // Get all items in the inventory
    public List<Item> getAllItems() {
        return items.values();
    }
}