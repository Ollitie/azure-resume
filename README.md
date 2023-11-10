# Cloud resume in Azure
My implementation of Cloud resume challenge, in Azure. Since this was more of a developer focused project and that is not my strongest suite at the moment, A Cloud Guru tutorial helped a lot with the coding parts.

# Components
Frontend:
- A nice looking static website template by ceevee that I customized to fit my needs
- Visitor counter: Javascript code in main.js

Backend:
- Azure CosmosDB to store visitor counter data
- Azure Functions to get and update visitor count in CosmosDB. Code in C#, originally by madebygps. I made some changes to the code as I'm trying to provision Azure resources with Bicep -> now Functions code adds a count item to the database container after it is provisioned.