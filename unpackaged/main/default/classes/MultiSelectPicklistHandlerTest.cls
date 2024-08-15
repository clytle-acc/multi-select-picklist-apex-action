@isTest
public class MultiSelectPicklistHandlerTest {
    @isTest
    static void testUpdateMultiSelectPicklistValues(){
        //Create test data 
        List<MultiSelectPicklistHandler.Request> requests = new List<MultiSelectPicklistHandler.Request>();
        
        //Test Adding
        MultiSelectPicklistHandler.Request testAdding = new MultiSelectPicklistHandler.Request();
        testAdding.currentValues = 'Donor;Student'; 
        testAdding.newValueToAdd = 'Trustee'; 
        requests.add(testAdding); 
        
        //Test Removing
        MultiSelectPicklistHandler.Request testRemoving = new MultiSelectPicklistHandler.Request();
        testRemoving.currentValues = 'Donor;Student;Trustee'; 
        testRemoving.newValueToAdd = 'Former Trustee'; 
        testRemoving.valueToRemove = 'Trustee'; 
        requests.add(testRemoving); 
        
        //Call Handler Method
        List<String> updatedValuesList = MultiSelectPicklistHandler.updateMultiSelectPicklistValues(requests);
        system.debug(updatedValuesList);     
        System.assertEquals(2, updatedValuesList.size(), 'Number of updated values list should be 2'); 
        System.assertEquals('Donor;Student;Trustee', updatedValuesList[0], 'updated values list does not match for testAdding'); 
        System.assertEquals('Donor;Student;Former Trustee', updatedValuesList[1], 'updated values list does not match for testRemoving'); 
        
    }

}