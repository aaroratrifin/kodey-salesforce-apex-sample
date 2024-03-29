public class OrderService {

    // Method to create an order
    public static void createOrder(String customerId, Date orderDate) {
        try {
            Order__c newOrder = new Order__c(CustomerId__c = customerId, OrderDate__c = orderDate);
            insert newOrder;
            System.debug('Order created successfully. Order Id: ' + newOrder.Id);
        } catch (Exception e) {
            System.debug('Error creating order: ' + e.getMessage());
        }
    }

    // Method to add item to an order
    public static void addItemToOrder(Id orderId, String productId, Integer quantity) {
        try {
            OrderItem__c newItem = new OrderItem__c(OrderId__c = orderId, ProductId__c = productId, Quantity__c = quantity);
            insert newItem;
            System.debug('Item added to order successfully. Item Id: ' + newItem.Id);
        } catch (Exception e) {
            System.debug('Error adding item to order: ' + e.getMessage());
        }
    }

    // Method to update order status
    public static void updateOrderStatus(Id orderId, String newStatus) {
        try {
            Order__c orderToUpdate = [SELECT Id, Status__c FROM Order__c WHERE Id = :orderId LIMIT 1];
            orderToUpdate.Status__c = newStatus;
            update orderToUpdate;
            System.debug('Order status updated successfully. Order Id: ' + orderToUpdate.Id);
        } catch (Exception e) {
            System.debug('Error updating order status: ' + e.getMessage());
        }
    }
}