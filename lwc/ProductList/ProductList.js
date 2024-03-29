import { LightningElement, wire, track } from 'lwc';
import getProducts from '@salesforce/apex/ProductService.getProducts';

export default class ProductList extends LightningElement {
    @track products;
    @track columns = [
        { label: 'Product Name', fieldName: 'Name', type: 'text' },
        { label: 'Price', fieldName: 'Price__c', type: 'currency' },
        { label: 'Quantity', fieldName: 'Quantity__c', type: 'number' },
    ];

    @wire(getProducts)
    wiredProducts({ error, data }) {
        if (data) {
            this.products = data;
        } else if (error) {
            this.products = undefined;
            console.error('Error fetching products:', error);
        }
    }
}