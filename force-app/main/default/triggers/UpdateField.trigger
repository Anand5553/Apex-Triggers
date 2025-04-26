trigger UpdateField on Account (after update) {
    switch on Trigger.operationType{
        when AFTER_UPDATE{
            WebsiteHandler.Handling(Trigger.new,Trigger.oldMap);
        }
    }

}