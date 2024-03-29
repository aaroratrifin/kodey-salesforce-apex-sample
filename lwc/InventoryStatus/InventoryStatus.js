import { LightningElement, wire, track } from 'lwc';
import getInventoryItems from '@salesforce/apex/InventoryService.getInventoryItems';

export default class InventoryStatus extends LightningElement {
    @track inventoryItems;
    @track columns = [
        { label: 'Product Name', fieldName: 'Name', type: 'text' },
        { label: 'Quantity', fieldName: 'Quantity__c', type: 'number' },
        { label: 'Status', fieldName: 'Status__c', type: 'text' }
    ];

    @wire(getInventoryItems)
    wiredInventoryItems({ error, data }) {
        if (data) {
            this.inventoryItems = data;
        } else if (error) {
            this.inventoryItems = undefined;
            console.error('Error fetching inventory items:', error);
        }
    }
}