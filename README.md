extjs-model-ninja
=================

A bash script for working with models in ExtJS.

### Example

The given model definition, `Person.js`:

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
    	]
    });

And then using the `-c` flag, we do `model-ninja.sh -c Person.create Person.js`, which outputs the following to `Person.create`:

	Ext.create('App.model.Person', {
    	id: ,
    	creatorID: ,
    	created: ,
    	modifierID: ,
    	modified: ,
    	firstName: ,
    	lastName: ,
    	phoneHome: ,
    	note: 
  	});

### About

While working with ExtJS, I find myself defining models and then doing the same things over and over again with those models that take up time. Usually I'm making an `Ext.create()` statement based off a model definition or I'm creating a form in a UI based off of a model. I lose lots of time copying the structure of a model over and over again into these two basic forms.

This script will start with those two functions, Ext.create statements and UI forms, but if you would like to see the script be able to do more, please don't hesitate to fork and request a pull. Any and all colaboration is welcome!

See [**Issues**](https://github.com/milesmatthias/extjs-model-ninja/issues) for what is currently being worked on.

