trigger RoomTrgr on Room__c (before insert,before update) {
    if(trigger.isbefore && (Trigger.isinsert || trigger.isUpdate)){
        Rooms.roomhandler(trigger.new);
    }

}