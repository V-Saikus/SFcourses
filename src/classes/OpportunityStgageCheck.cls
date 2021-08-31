public class OpportunityStgageCheck {
    
    public static List<Opportunity> updateOpportunityStage(String stageNew, String stageOld){

        List<Schema.PicklistEntry> opportunityStages = Opportunity.StageName.getDescribe().getPicklistValues();
        System.debug(opportunityStages);
        List<String> oppStages = new List<String>();
        for(Schema.PicklistEntry oppStage : opportunityStages) oppStages.add(oppStage.getvalue());
        if (!(oppStages.contains(stageNew) && oppStages.contains(stageOld))){
            System.debug('Input is not valid');
            return Null;
        }
        
        List<Opportunity> opportunities = [SELECT StageName FROM Opportunity WHERE StageName = :stageOld];
        for(Opportunity opp : opportunities) opp.StageName = stageNew;
        update opportunities;
        return opportunities;
    }
}