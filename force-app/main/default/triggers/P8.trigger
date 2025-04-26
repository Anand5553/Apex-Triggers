trigger P8 on Account (before update) {
    if(trigger.isBefore && trigger.isUpdate){
        OwnershipHandler.OwnerShip(trigger.new, trigger.oldMap);
    }
}