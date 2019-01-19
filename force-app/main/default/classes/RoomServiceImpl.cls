public with sharing class RoomServiceImpl {
    public RoomServiceImpl() {
    }
    public void checkIn(String contactId){
        if(contactId != null && new LoyaltyProgramService().isThisContactPartOfLoyaltyProgram(contactId)){
            new LoyaltyProgramService().registerCheckInForContact(contactId);
        }
        
    }
}