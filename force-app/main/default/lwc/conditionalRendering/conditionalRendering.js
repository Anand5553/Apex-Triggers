import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    clickOne = false;
    clickTwo = false;
    clickThree = false;
    anand = false;

    clickedOne(event){
        console.log("Hello");
        this.clickOne =  !this.clickOne;
        this.anand = !this.anand;
        this.clickTwo = false;
        this.clickThree = false;
    }
    clickedTwo(event){
        this.clickTwo = !this.clickTwo;
        this.clickOne = false;
        this.clickThree = false;

    }
    clickedThree(event){
        this.clickThree = !this.clickThree;
        this.clickOne = false;
        this.clickTwo = false;
    }
}