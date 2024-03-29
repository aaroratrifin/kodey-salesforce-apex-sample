public class OrderItemService {

    // Method to create an order item
    public static void createOrderItem(Id orderId, String productId, Integer quantity) {
        try {
            OrderItem__c newOrderItem = new OrderItem__c(OrderId__c = orderId, ProductId__c = productId, Quantity__c = quantity);
            insert newOrderItem;
            System.debug('Order item created successfully. Item Id: ' + newOrderItem.Id);
        } catch (Exception e) {
            System.debug('Error creating order item: ' + e.getMessage());
        }
    }

    // Method to update order item quantity
    public static void updateOrderItemQuantity(Id orderItemId, Integer newQuantity) {
        try {
            OrderItem__c orderItemToUpdate = [SELECT Id, Quantity__c FROM OrderItem__c WHERE Id = :orderItemId LIMIT 1];
            orderItemToUpdate.Quantity__c = newQuantity;
            update orderItemToUpdate;
            System.debug('Order item quantity updated successfully. Item Id: ' + orderItemToUpdate.Id);
        } catch (Exception e) {
            System.debug('Error updating order item quantity: ' + e.getMessage());
        }
    }

    // Method to calculate subtotal for an order item
    public static Decimal calculateSubtotal(Id orderItemId) {
        try {
            OrderItem__c orderItem = [SELECT Id, Quantity__c, ProductId__c FROM OrderItem__c WHERE Id = :orderItemId LIMIT 1];
            Product__c product = [SELECT Id, Price__c FROM Product__c WHERE Id = :orderItem.ProductId__c LIMIT 1];
            Decimal subtotal = orderItem.Quantity__c * product.Price__c;
            System.debug('Subtotal calculated successfully for Item Id: ' + orderItem.Id + ' Subtotal: ' + subtotal);
            return subtotal;
        } catch (Exception e) {
            System.debug('Error calculating subtotal: ' + e.getMessage());
            return null;
        }
    }
}