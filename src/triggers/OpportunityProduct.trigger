trigger OpportunityProduct on OpportunityLineItem (after insert, before delete) {
            //List<Opportunity> listOpportunities = [SELECT Id, Amount, Priority__c FROM Opportunity WHERE Id IN :[SELECT OpportunityId FROM OpportunityLineItem ]];

    if(Trigger.IsInsert){
        Set<Id> setOpportunityIds = new Set<Id>();
        for(OpportunityLineItem opportunityLineItem : Trigger.New){
            setOpportunityIds.add(opportunityLineItem.OpportunityId);
        }
        List<Opportunity> listOpportunities = [SELECT Id, Amount, Priority__c FROM Opportunity WHERE Id IN :setOpportunityIds];
        List<Opportunity> listOpportunitiesToUpdate = new List<Opportunity>();
        
        for(Opportunity opportunity : listOpportunities){
            if(opportunity.Amount > 10000 && !opportunity.Priority__c){
                opportunity.Priority__c = True;
                listOpportunitiesToUpdate.add(opportunity);
            }
            else if(opportunity.Amount < 10000 && opportunity.Priority__c){
                opportunity.Priority__c = False;
                listOpportunitiesToUpdate.add(opportunity);
            }
        }
        update listOpportunitiesToUpdate;
    }
    
    else 
    if(Trigger.IsDelete){
        Set<Id> setOpportunityIds = new Set<Id>();
        for(OpportunityLineItem opportunityLineItem : Trigger.Old){
            setOpportunityIds.add(opportunityLineItem.OpportunityId);
        }
        List<Opportunity> listOpportunities = [SELECT Id, Amount, Priority__c FROM Opportunity WHERE Id IN :setOpportunityIds];
        List<Opportunity> listOpportunitiesToUpdate = new List<Opportunity>();
        
        for(Opportunity opportunity : listOpportunities){
            if(opportunity.Amount > 10000 && !opportunity.Priority__c){
                opportunity.Priority__c = True;
                listOpportunitiesToUpdate.add(opportunity);
            }
            else if(opportunity.Amount < 10000 && opportunity.Priority__c){
                opportunity.Priority__c = False;
                listOpportunitiesToUpdate.add(opportunity);
            }
        }
        update listOpportunitiesToUpdate;
    }
}