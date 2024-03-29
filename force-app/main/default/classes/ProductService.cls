public class ProductService {

    // Method to create a new product
    public static void createProduct(String productName, Decimal price, Integer quantity) {
        try {
            Product__c newProduct = new Product__c(Name = productName, Price__c = price, Quantity__c = quantity);
            insert newProduct;
            System.debug('Product created successfully. Product Id: ' + newProduct.Id);
        } catch (Exception e) {
            System.debug('Error creating product: ' + e.getMessage());
        }
    }

    // Method to update a product
    public static void updateProduct(Id productId, String productName, Decimal price, Integer quantity) {
        try {
            Product__c productToUpdate = [SELECT Id, Name, Price__c, Quantity__c FROM Product__c WHERE Id = :productId LIMIT 1];
            productToUpdate.Name = productName;
            productToUpdate.Price__c = price;
            productToUpdate.Quantity__c = quantity;
            update productToUpdate;
            System.debug('Product updated successfully. Product Id: ' + productToUpdate.Id);
        } catch (Exception e) {
            System.debug('Error updating product: ' + e.getMessage());
        }
    }

    // Method to delete a product
    public static void deleteProduct(Id productId) {
        try {
            Product__c productToDelete = [SELECT Id FROM Product__c WHERE Id = :productId LIMIT 1];
            delete productToDelete;
            System.debug('Product deleted successfully.');
        } catch (Exception e) {
            System.debug('Error deleting product: ' + e.getMessage());
        }
    }
}