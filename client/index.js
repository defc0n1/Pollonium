// JS for template-specific handling


Template.survey.greeting = function () {
    return "Welcome to pollonium.";
};

Template.survey.events({
    'click input': function () {
        // template data, if any, is available in 'this'
        if (typeof console !== 'undefined')
            console.log("You pressed the button");
    }
});

