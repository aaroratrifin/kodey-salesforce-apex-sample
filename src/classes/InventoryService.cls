public class InventoryService {

        // Method to add inventory
        public static void addInventory(String productId, Integer quantityToAdd) {
            try {
                Product__c productToUpdate = [SELECT Id, Quantity__c FROM Product__c WHERE Id = :productId LIMIT 1];
                productToUpdate.Quantity__c += quantityToAdd;
                update productToUpdate;
                System.debug('Inventory added successfully. Product Id: ' + productToUpdate.Id);
            } catch (Exception e) {
                System.debug('Error adding inventory: ' + e.getMessage());
            }
        }
        
        // Method to update inventory quantity
        public static void updateInventoryQuantity(String productId, Integer newQuantity) {
            try {
                Product__c productToUpdate = [SELECT Id, Quantity__c FROM Product__c WHERE Id = :productId LIMIT 1];
                productToUpdate.Quantity__c = newQuantity;
                update productToUpdate;
                System.debug('Inventory quantity updated successfully. Product Id: ' + productToUpdate.Id);
            } catch (Exception e) {
                System.debug('Error updating inventory quantity: ' + e.getMessage());
            }
        }
        
        // Method to retrieve inventory information
        public static Product__c getInventoryInfo(String productId) {
            try {
                Product__c productInfo = [SELECT Id, Name, Price__c, Quantity__c FROM Product__c WHERE Id = :productId LIMIT 1];
                return productInfo;
            } catch (Exception e) {
                System.debug('Error retrieving inventory information: ' + e.getMessage());
                return null;
            }
        }
    }