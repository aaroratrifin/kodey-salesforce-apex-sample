import { LightningElement, wire, track } from 'lwc';
import getProducts from '@salesforce/apex/ProductService.getProducts';

export default class ProductList extends LightningElement {
    @track products;

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