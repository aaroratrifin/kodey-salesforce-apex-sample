import { LightningElement, wire, track } from 'lwc';
import getInventoryStatus from '@salesforce/apex/InventoryService.getInventoryStatus';

export default class InventoryStatus extends LightningElement {
    @track inventoryItems;

    @wire(getInventoryStatus)
    wiredInventoryStatus({ error, data }) {
        if (data) {
            this.inventoryItems = data;
        } else if (error) {
            this.inventoryItems = undefined;
            console.error('Error fetching inventory status:', error);
        }
    }
}