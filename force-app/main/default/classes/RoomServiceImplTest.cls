@Istest
public class RoomServiceImplTest {
	@Istest
    static void RoomServiceImplTesting(){
       // Create a Unit Of Work
       fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                room__c.SObjectType
                    }
        );
       Account acc= new Account();
       acc.Name ='Test Account';
       uow.registerNew(acc); 
       // Commit the work to the database!
       System.assertnotEquals(null,acc);
       Contact con = new Contact(LastName='Test Contact');
      
       //uow.registerRelationship(con, con.AccountId, acc)
       uow.registerNew(con, Contact.AccountId, acc);
       // Commit the work to the database!
      
       System.assertnotEquals(null,con);
       Room__c room = new Room__c ();
       room.Name = 'RM01';
       room.Guest__c = con.id ;
      
      uow.registerNew(room, Room__c.Guest__c, con);
        // Commit the work to the database!
        uow.commitWork();
        System.assertnotEquals(null,room);
        test.starttest();
        new RoomServiceImpl().checkIn(con.id); 
        
        test.stopTest();
    }
    @Istest
    static void RoomServiceImplTesting2(){
       // Create a Unit Of Work
       fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new Schema.SObjectType[] {
                Account.SObjectType,
                Contact.SObjectType,
                room__c.SObjectType
                    }
        );
       Account acc= new Account();
       acc.Name ='Test Account';
       uow.registerNew(acc); 
       // Commit the work to the database!
       System.assertnotEquals(null,acc);
       Contact con = new Contact(LastName='Test Contact',IsMember__c =true);
      
       //uow.registerRelationship(con, con.AccountId, acc)
       uow.registerNew(con, Contact.AccountId, acc);
       // Commit the work to the database!
      
       System.assertnotEquals(null,con);
       Room__c room = new Room__c ();
       room.Name = 'RM01';
       room.Guest__c = con.id ;
      
       uow.registerNew(room, Room__c.Guest__c, con);
        // Commit the work to the database!
        uow.commitWork();
        System.assertnotEquals(null,room);
        test.starttest();
        new RoomServiceImpl().checkIn(con.id); 
        
        test.stopTest();
       
       
    }
}