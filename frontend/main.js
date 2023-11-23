window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
})

//const functionApi = 'https://func-azurecloudresume-api-ik7k.azurewebsites.net/api/GetResumeCounter?code=V8Rr0_4M3n7ZAWMl2-YVhYR5NSfnLOx_VyPN9Z7H4Ul5AzFue0iA6w=='

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