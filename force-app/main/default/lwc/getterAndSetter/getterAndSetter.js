import { LightningElement } from 'lwc';

export default class GetterAndSetter extends LightningElement {
    numberOfMoviesWatched = 10;

    get moviesWatchedOnMonday(){
        return this.numberOfMoviesWatched*10;
    }

    set moviesWatchedOnMonday(value){
        this.numberOfMoviesWatched = value;
    }

    handleChange(event){
        this.moviesWatchedOnMonday = event.target.value;
    }
}