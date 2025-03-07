# Rasberi_Pi_IAC
Repository to host all of the required IAC including Raspberri_pi Side cloud archetecture, Scripts for the raspberry pi setup process, etc

# Raspberry Pi IAC Repo Deployment Order
1. Roles 
2. Dynamo DB
---- Lambda for task 1 need deployed in seporate repo ------
3. API Gateway Task 1
4. iot_fleet
---- Lambda for task 2 need deployed in seporate repo ------
5. API Gateway Task 2


**Lambda Roles/Policies to be hosted in a seporate IAC Repo for each Lambda
# IAM Permissions - Task 1
Dynamo DB needs permissions to allow lambda to read and write from it
Lambda to read and write for the Dynamo DB
Lambda to be event based trigger from api gateway, needs permissions.
API Gateway needs permissions to trigger lambda
API GAteway needs a static API Key to authenticate with it to prevent NON Pi Users form putting their Serial Number on the database

# IAM Permissions - Task 2
Dynamo DB needs permissions to allow lambda to read and write form it
AWS IoT Cert Issuer needs permissions to allow lambda to make a request to the template and return the required certificates for authentication with the topic
Cert issuer needs permission to allow lambda to talk to it(If required)
Lambda need spermission for API Gateway to send a message to it
API Gateway needs permissions to trigger lambda
API Gateway needs a static API Key to authenticate with it to prevent NON Pi Users from getting a certificate thats associated with the IoT Core
Raspberry Pi Needs permissions to assume the IAM Role for the temporaty acess keys to then talk to api gateway

# Pi Use and Authentication
Pi needs to beable to use certificates provided and other credentials provided via the Task 2 to Successfully authenticate with AWS IoT Topics, read from them, write to them, etc

