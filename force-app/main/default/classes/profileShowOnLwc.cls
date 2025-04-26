public with sharing class profileShowOnLwc {

    @AuraEnabled(cacheable = true)
    public static List<Profile> getProfile() {
        try{
            List<Profile> profiles  = [SELECT Id,Name,UserLicenseId,UserLicense.Name From Profile WHERE     UserLicense.Name = 'Salesforce'];

            return profiles;
        }
        catch(Exception e){
            throw new AuraHandledException('Exception is'+ e.getMessage());
        }
    }
}