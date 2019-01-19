public with sharing class RoomSelector {
    public RoomSelector() {

    }
    public List<room__c> selectRoomByIds(Set<Id> setofRoomIds){
        List<room__c> listOfRooms;
        if(setofRoomIds != null && setofRoomIds.Size()> 0){
            listOfRooms =  [Select id,Name,Guest__c,Occupied__c from room__c Where Id In:setofRoomIds];
            return listOfRooms;
        }
        return listOfRooms;    
    }
}