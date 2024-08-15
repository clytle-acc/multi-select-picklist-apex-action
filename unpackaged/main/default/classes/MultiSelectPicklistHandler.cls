public class MultiSelectPicklistHandler {
    
    public class Request {
        @InvocableVariable
        public String currentValues;
        
        @InvocableVariable
        public String newValueToAdd;
        
        @InvocableVariable
        public String valueToRemove;
    }
    
    @InvocableMethod
    public static List<String> updateMultiSelectPicklistValues(List<Request> requests) {
        
        List<String> updatedValuesList = new List<String>();
        System.debug(requests);
        for (Request req : requests) {
            // Split the current values into a Set
            Set<String> currentValues = new Set<String>();
            if (!String.isEmpty(req.currentValues)) {
                currentValues.addAll(req.currentValues.split(';'));
            } 
            
            // Add the new value if it's not already in the set
            /*if (!String.isEmpty(req.newValueToAdd) && !currentValues.contains(req.newValueToAdd)) {
currentValues.add(req.newValueToAdd);
}*/
            if (!String.isEmpty(req.newValueToAdd)) {
                for(String s : req.newValueToAdd.split(';')){
                    if(!currentValues.contains(s)){
                        currentValues.add( s);
                    }
                }
            }
            // Remove the value to remove if it's in the set
            /*if (!String.isEmpty(req.valueToRemove) && currentValues.contains(req.valueToRemove)) {
currentValues.remove(req.valueToRemove);
}*/
            if (!String.isEmpty(req.valueToRemove)) {
                for(String s : req.valueToRemove.split(';')){
                    if(currentValues.contains(s)){
                        currentValues.remove(s);
                    }
                }
            }
            // Join the values back into a single string
            String updatedValues = String.join(new List<String>(currentValues), ';');
            updatedValuesList.add(updatedValues);
        }
        
        return updatedValuesList;
    }
}