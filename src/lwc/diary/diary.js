/**
 * Created by Володимир on 20.08.2021.
 */

import {LightningElement, track} from 'lwc';
import getNoteList from '@salesforce/apex/Note.getNoteList';
import newNote from '@salesforce/apex/Note.newNote';

export default class Diary extends LightningElement {
    @track arr = [];
    @track error;

    connectedCallback() {
        console.log("load");
        getNoteList()
            .then(result => {
                this.arr = [];
                result.forEach((element, index) => {
                    this.arr.push({text:element.Note__c, secret:element.Secret__c});
                });
            });
    }

    handleClick(event){

        let inputNote = this.template.querySelector('[data-id="note-input"]');
        let inputSecret = this.template.querySelector('[data-id="secret-input"]');
        this.arr.push({text:inputNote.value, secret:inputSecret.checked});
        newNote({text:inputNote.value, secret: inputSecret.checked})
            .then(result => {
                console.log('then: ' + result);
            })
            .catch(e => {
                console.log('error: ' + e);
                console.log(e);
            });
        inputNote.value='';

    }
}