trigger CreateNContact on Account (after insert) {
    switch on Trigger.operationType{
        when AFTER_INSERT{
            ContactCreateInAccount.NAccount(Trigger.new);
		}
    }

}