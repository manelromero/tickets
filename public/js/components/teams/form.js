Class('Teams.Form', {

    Extends: Component,

    initialize: function() {
        Teams.Form.Super.call(this, 'formulary');
        this.element.addEventListener('submitted', this.createTeam.bind(this));
        this.listing = document.getElementById('listing');
        this.retrieveList();
    },

    retrieveList: function() {
        Bus.publish('list.retrieve');
    },

    renderList: function(list) {
        this.listing.list = list;
    },

    createTeam: function(event) {
        teamName = event.detail;
        Bus.publish('team.save', teamName);
    },

    subscribe: function() {
        Bus.subscribe('list.retrieved', this.renderList.bind(this));
        Bus.subscribe('team.saved', this.retrieveList.bind(this));
    }

});
