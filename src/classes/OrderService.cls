public class OrderService {

        // Method to create an order
        public static void createOrder(String customerId, List<String> productIds, List<Integer> quantities) {
            try {
                // Assuming Order__c is a custom object representing an order
                // Assuming OrderItem__c is a custom object representing an item in an order
                Order__c newOrder = new Order__c(CustomerId__c = customerId, Status__c = 'New');
                insert newOrder;
                
                for(Integer i = 0; i < productIds.size(); i++) {
                    Product__c product = [SELECT Id, Price__c FROM Product__c WHERE Id = :productIds[i] LIMIT 1];
                    OrderItem__c newItem = new OrderItem__c(OrderId__c = newOrder.Id, ProductId__c = product.Id, Quantity__c = quantities[i], Price__c = product.Price__c);
                    insert newItem;
                }
                
                System.debug('Order created successfully. Order Id: ' + newOrder.Id);
            } catch (Exception e) {
                System.debug('Error creating order: ' + e.getMessage());
            }
        }
        
        // Method to add item to an order
        public static void addItemToOrder(String orderId, String productId, Integer quantity) {
            try {
                Product__c product = [SELECT Id, Price__c FROM Product__c WHERE Id = :productId LIMIT 1];
                OrderItem__c newItem = new OrderItem__c(OrderId__c = orderId, ProductId__c = product.Id, Quantity__c = quantity, Price__c = product.Price__c);
                insert newItem;
                
                System.debug('Item added to order successfully. Order Id: ' + orderId);
            } catch (Exception e) {
                System.debug('Error adding item to order: ' + e.getMessage());
            }
        }
        
        // Method to update order status
        public static void updateOrderStatus(String orderId, String newStatus) {
            try {
                Order__c orderToUpdate = [SELECT Id, Status__c FROM Order__c WHERE Id = :orderId LIMIT 1];
                orderToUpdate.Status__c = newStatus;
                update orderToUpdate;
                
                System.debug('Order status updated successfully. Order Id: ' + orderId);
            } catch (Exception e) {
                System.debug('Error updating order status: ' + e.getMessage());
            }
        }
    }