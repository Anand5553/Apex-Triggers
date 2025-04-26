import { LightningElement,wire } from 'lwc';
import getProfiles from '@salesforce/apex/profileShowOnLwc.getProfile';

export default class ShowProfile extends LightningElement {
    profiles;
    columns = [
        {label : 'Name of Profile',fieldName : 'Name',type : 'text'},
        {label : 'License Name',fieldName : 'UserLicenseName',type : 'text'},
        {label : 'Anand ka Table',fieldName : 'subham',type : 'email'}
    ];
    

    @wire(getProfiles) profiles({data,error}){
        if(data){
            this.profiles = data.map(profile =>({
                Id : profile.Id,
                Name : profile.Name,
                UserLicenseName : profile.UserLicense.Name,
                subham : 'ananddash555@gmail.com'
            }))
        }
        if(error){
            console.log("error occured");
        }
    };
}
