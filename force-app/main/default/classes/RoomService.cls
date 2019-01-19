public with sharing class RoomService {
    public RoomService() {
    }
    public void checkingRoom(String roomId,string contactId){
        try{
            List<room__c> listOfSelectedRoom = new RoomSelector().selectRoomByIds(New set<id>{roomId});
            System.debug('listOfSelectedRoom'+listOfSelectedRoom);
            if(listOfSelectedRoom != null && listOfSelectedRoom.size()>0){
                if(listOfSelectedRoom[0].Guest__c != null){
                     System.debug('Room is Already occupied by someone');
                }
                else{
                    Room__c room = new Room__c(id = roomId,Guest__c =contactId);
                	// Create a Unit Of Work
                    fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
                        new Schema.SObjectType[] {
                        	room__c.SObjectType
                        }
                	);
                    uow.registerDirty(room);
               		// Commit the work to the database!
                	uow.commitWork();
                }    
            }
               
        }
        catch(Exception e){
            throw e;
        } 
    }
    public void checkout(String roomId, String contactId){
        List<room__c> listOfSelectedRoom = new RoomSelector().selectRoomByIds(New set<id>{roomId});
        if(listOfSelectedRoom != null && listOfSelectedRoom.size() >0){
            System.debug('This room is occupied ');
            Room__c room = listOfSelectedRoom[0];
            room.Guest__c = null;
            room.Occupied__c =false;
             // Create a Unit Of Work
            fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
                new Schema.SObjectType[] {
                    room__c.SObjectType
                }
            );
            uow.registerDirty(room);
            
            // Commit the work to the database!
            uow.commitWork();
        }
    }
}