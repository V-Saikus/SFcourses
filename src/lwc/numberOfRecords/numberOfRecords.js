/**
 * Created by Володимир on 25.08.2021.
 */

import {LightningElement, api} from 'lwc';
import getNoteList from '@salesforce/apex/Note.getNoteList';
import DeleteAllNotes from '@salesforce/apex/Note.DeleteAllNotes';

export default class NumberOfRecords extends LightningElement {

    @api count;

    async connectedCallback() {
        const noteList = await getNoteList();
        this.count = noteList.length;
    }

    handleClick(event){
        DeleteAllNotes()
            .then(result => {
                console.log('then: ' + result);
                this.count = 0;
            })
            .catch(e => {
                console.log('error: ' + e);
                console.log(e);
            });
    }
}