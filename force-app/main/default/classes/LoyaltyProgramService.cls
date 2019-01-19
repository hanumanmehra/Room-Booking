public class LoyaltyProgramService {
    public Boolean isThisContactPartOfLoyaltyProgram( Id contactId ){
        if(contactId != null){
           Contact con = [Select id,IsMember__c from Contact where Id=:contactId]; 
            if(con != null && con.IsMember__c)
                return true;
            else
              registerCheckInForContact(contactId);  
        }
       
        return false;
    }
    public void registerCheckInForContact( id contactId ){
        //Code for registercheckInForContact
    }

}