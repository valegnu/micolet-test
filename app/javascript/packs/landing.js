window.addEventListener("load", () => {
    init()
    
    const element = document.querySelector("#submit-btn")

    element.addEventListener("click", (event) => {
	event.preventDefault()
	perform()
    });
});

// Vars
function email() {
    return document.querySelector("#suscription_email")
}

function checks() {
    return document.querySelectorAll(".preferences_option")
}

function progress() {
    return document.querySelector("#progress")
}
// Functions
function init() {
    document.querySelector("#errors-container").style.display = 'none'
    document.querySelector("#progress").style.display = 'none'
}

function perform() {
    if (emailHasValue() && preferencesIsSelected())
	sendRequest()
    else
	showIncompleteMessage()
}

function emailHasValue() {
    if (email().value.length > 0)
	return true
    else
	return false
}

function preferencesIsSelected() {
    for (i = 0; i < checks().length; i++) {
	if (checks()[i].checked)
	    return true
    }

    return false
}

function constructPreferences() {
    var preferences = '{'

    checks().forEach((element) => {
	valueInput = element.getAttribute('value')
	preferences +=
	    element.checked ? '"' + valueInput + '": true,' : '"' + valueInput + '": false,' 
    });

    return JSON.parse(preferences.substring(0, preferences.length - 1) + '}')
}

function sendRequest() {
    progress().style.display = 'block'
        
    fetch('/new_suscription', {
	method: 'POST',
	headers: {
	    'Content-Type': 'application/json',
	},
	body: JSON.stringify({
	    locale: document.querySelector("#locale").value,
	    email: email().value,
	    preferences: constructPreferences()
	}),
    })
    .then(response => response.json())
    .then(data => {

	if (data['message'] == "error")
	    showErrors(data)
	else
	    sucess(data)
	    
    })
    .catch((error) => {
        progress().style.display = 'none'
	showUnknownError()
    });
}

function sucess(data) {
    progress().style.display = 'none'
    cleanForm()
    showSuccessMessage()
}

function showErrors(data) {
    progress().style.display = 'none'
    
    var html = "";

    data['errors'].forEach((element) => {
	html += "<p> - "+ element +"</p>"
    });

    document.querySelector("#errors-msg").innerHTML = html
    document.querySelector("#errors-container").style.display = 'block'
}

function cleanForm() {
    cleanChecks()
    email().value = ""
    document.querySelector("#errors-container").style.display = 'none'
}

function cleanChecks() {
    checks().forEach((element) => {
	element.checked = false 
    });
}

function showUnknownError() {
    M.toast( { html: document.querySelector("#unknown-error").value } )
}

function showIncompleteMessage() {
    M.toast( { html: document.querySelector("#incomplete-message").value } )
}

function showSuccessMessage() {
    M.toast( { html: document.querySelector("#success-message").value } )
}
