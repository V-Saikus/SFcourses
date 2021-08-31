/**
 * Created by Володимир on 25.08.2021.
 */

public with sharing class Note {
    @AuraEnabled(cacheable=true)
    public static List<Diary__c> getNoteList(){
        return [SELECT Note__c, Secret__c FROM Diary__c];
    }

    @AuraEnabled
    public static Integer newNote(String text, Boolean secret){
        Diary__c diary = new Diary__c(Note__c=text, Secret__c=secret);
        insert diary;
        return 5;
    }

    @AuraEnabled
    public static void DeleteAllNotes(){
        List<Diary__c> diaries = new List<Diary__c>();
        diaries = [SELECT Id FROM Diary__c];
        delete diaries;
    }
}