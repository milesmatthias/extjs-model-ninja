/**
* @author Miles Matthias
* @class App.model.Person
* @extends Ext.data.Model

Model structure for representing people

*/
Ext.define('App.model.Person', {
    extend: 'Ext.data.Model',
    idProperty: 'id',
    fields: [
        {name: 'id', type: 'string'},
        {name: 'creatorID', type: 'string'},
        {name: 'created', type: 'date'},
        {name: 'modifierID', type: 'string'},
        {name: 'modified', type: 'date'},
        {name: 'firstName', type: 'string'},
        {name: 'lastName', type: 'string'},
        {name: 'phoneHome', type: 'string'},
        {name: 'note', type: 'string'},
    ],

    proxy: {
        type: 'webdb',
        dbName: 'app',
        dbTable: 'Person'
    }
});
