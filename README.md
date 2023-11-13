# Cloud resume in Azure
My implementation of Cloud resume challenge, in Azure. The goal was to build a static resume website that is hosted in Azure blob storage; implement a visitor counter that uses Azure Functions to get and update visitor counter data stored in CosmosDB database; use Azure CDN to enable https and custom domain; build a CI/CD pipeline with Github Actions to make the website publishing effortless.

Since this was more of a developer focused project and that is not my strongest suite at the moment, A Cloud Guru tutorial helped a lot with the coding parts. My main goals were to get hands-on experience with various Azure resources, get a feel how they work together, inspect how manual resource deployments and configurations could be replaced with IaC, and get experience using git and GitHub as well as building a CI/CD pipeline.


# Components
Frontend:
- A nice looking static website template by ceevee that I customized to fit my needs.
- Visitor counter: Javascript code in main.js that triggers an Azure Function

Backend:
- Azure CosmosDB database to store visitor counter data
- Azure Functions binded to CosmosDB, to get and update the visitor counter data. Code in C#, originally by madebygps. I made some changes to the code as I'm trying to provision Azure resources with Bicep -> now Functions code adds a count item to the database container after it is provisioned.
- Static website hosting in a blob storage.
- Azure CDN to enable custom domain and https
- Azure DNS to host my custom domain in Azure and to add CNAME records.

CI/CD with GitHub Actions:
- Frontend workflow: Changes in website code and they are pushed to GitHub repository -> GitHub Actions updates the website files in Azure blob storage
- Backend workflow: Changes in the visitor counter code and changes are pushed to GitHub repository -> GitHub Actions updates the Azure Function