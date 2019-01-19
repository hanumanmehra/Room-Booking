public class Rooms {
    public static void roomhandler(List<Room__c> listOfRooms){
        for(Room__c room : listOfRooms){
                room.Occupied__c = room.Guest__c != null ? true:false;
                
        }
    }
}