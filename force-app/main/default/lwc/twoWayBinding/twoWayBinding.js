import { LightningElement } from 'lwc';

export default class TwoWayBinding extends LightningElement {
    inputtedByUser;
    handleClick(event){
        this.inputtedByUser = event.target.value;
    }
}