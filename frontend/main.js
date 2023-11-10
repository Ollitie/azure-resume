window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
})

const functionApi = 'https://getresumecounterolli.azurewebsites.net/api/GetResumeCounter?code=DV_U0f9XiVYKE-OL58PSIRZp475i_DMWpZOmIcCpXYT3AzFufJm0MQ=='

const getVisitCount = () => {
    let count = 10;
    fetch(functionApi).then(response => {
        return response.json()
    }).then(response => {
        console.log("Website called function API");
        count = response.count;
        document.getElementById("counter").innerText = count;
    }).catch(function(error){
        console.log(error);
    });
    return count;
}