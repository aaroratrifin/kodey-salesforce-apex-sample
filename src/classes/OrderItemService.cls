public class OrderItemService {

        // Method to create an order item
        public static void createOrderItem(String orderId, String productId, Integer quantity) {
            try {
                Product__c product = [SELECT Id, Price__c FROM Product__c WHERE Id = :productId LIMIT 1];
                OrderItem__c newOrderItem = new OrderItem__c(OrderId__c = orderId, ProductId__c = product.Id, Quantity__c = quantity, Subtotal__c = product.Price__c * quantity);
                insert newOrderItem;
                
                System.debug('Order item created successfully. Order Item Id: ' + newOrderItem.Id);
            } catch (Exception e) {
                System.debug('Error creating order item: ' + e.getMessage());
            }
        }
        
        // Method to update order item quantity
        public static void updateOrderItemQuantity(String orderItemId, Integer newQuantity) {
            try {
                OrderItem__c orderItemToUpdate = [SELECT Id, ProductId__c, Subtotal__c FROM OrderItem__c WHERE Id = :orderItemId LIMIT 1];
                Product__c product = [SELECT Id, Price__c FROM Product__c WHERE Id = orderItemToUpdate.ProductId__c LIMIT 1];
                orderItemToUpdate.Quantity__c = newQuantity;
                orderItemToUpdate.Subtotal__c = product.Price__c * newQuantity;
                update orderItemToUpdate;
                
                System.debug('Order item quantity updated successfully. Order Item Id: ' + orderItemToUpdate.Id);
            } catch (Exception e) {
                System.debug('Error updating order item quantity: ' + e.getMessage());
            }
        }
        
        // Method to calculate subtotal for an order item
        public static Decimal calculateSubtotal(String orderItemId) {
            try {
                OrderItem__c orderItem = [SELECT Id, Subtotal__c FROM OrderItem__c WHERE Id = :orderItemId LIMIT 1];
                return orderItem.Subtotal__c;
            } catch (Exception e) {
                System.debug('Error calculating subtotal: ' + e.getMessage());
                return null;
            }
        }
    }