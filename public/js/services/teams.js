Class('Services.Teams', {

    Extends: Service,

    initialize: function() {
        Services.Teams.Super.call(this, '/teams');
    },

    retrieveList: function() {
        this.doRequest('/list', '', function(result) {
            Bus.publish('list.retrieved', result);
        });
    },

    saveTeam: function(teamName) {
        var payload = { name: teamName };
        this.doRequest('/add', payload, function(result) {
            Bus.publish('team.saved', result);
        });
    },

    subscribe: function() {
        Bus.subscribe('list.retrieve', this.retrieveList.bind(this));
        Bus.subscribe('team.save', this.saveTeam.bind(this));
    }

});
