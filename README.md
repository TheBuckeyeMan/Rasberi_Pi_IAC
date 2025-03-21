# Rasberi_Pi_IAC
Repository to host all of the required IAC including Raspberri_pi Side cloud archetecture, Scripts for the raspberry pi setup process, etc

# Raspberry Pi IAC Repo Deployment Order
1. Roles - Done
2. Dynamo DB - Done
3. iot_fleet
4. Lambda for task 1 - IAC Done(Working on App)
5. API Gateway Task 1
6. Lambda for task 2 
7. API Gateway Task 2

**Lambda Roles/Policies to be hosted in a seporate IAC Repo for each Lambda
# IAM Permissions - Task 1
Dynamo DB needs permissions to allow lambda to read and write from it
Lambda to read and write for the Dynamo DB
Lambda to be event based trigger from api gateway, needs permissions.
Lambda to have permission to pull from ECR
API Gateway needs permissions to trigger lambda
API GAteway needs a static API Key to authenticate with it to prevent NON Pi Users form putting their Serial Number on the database

# IAM Permissions - Task 2
Dynamo DB needs permissions to allow lambda to read and write form it
AWS IoT Cert Issuer needs permissions to allow lambda to make a request to the template and return the required certificates for authentication with the topic
Cert issuer needs permission to allow lambda to talk to it(If required)
Lambda need spermission for API Gateway to send a message to it
Lambda to have permission to pull from ECR
API Gateway needs permissions to trigger lambda
API Gateway needs a static API Key to authenticate with it to prevent NON Pi Users from getting a certificate thats associated with the IoT Core
Raspberry Pi Needs permissions to assume the IAM Role for the temporaty acess keys to then talk to api gateway

# Pi Use and Authentication
Pi needs to beable to use certificates provided and other credentials provided via the Task 2 to Successfully authenticate with AWS IoT Topics, read from them, write to them, etc



# About the Resources

# DynamoDb
## Creating A Dynamo DB
Creating a dynamoDb is simple and easy. We do not need to attach any IAM policies to the table itself, IAM policies are only required on the requestor side(Application looking to get data)
Additionally, we do NOT NEED to provision a DATABASE OR SCHEMA since its a Non SQL based database
Primary Key is required(Hash_Key)
"S" = String
"N" = Number
"B" = Binary



# Next steps
1. Fix the api gateway - might simply be a needs a "depends on" tag
2. Finish Lambda IAC
3. Finish Lambda CD 
4.  Make Lambda function
5. Try to deploy lambda funciton

# Raspberri Pi Hardware notes

Worrying about over the wire: Mostly No – If you follow best practices, you should be fine!
However, a few key things will ensure a smooth setup:

WS2812B LEDs draw a lot of power (e.g., 60 LEDs can need 3A at full brightness).
If using more than ~30 LEDs, use a separate 5V power adapter for the LED strip instead of powering it from the Raspberry Pi.





1. RGB - Need an non-addressable RGB LED strip

2. Power supply - 12 v required

2. Will need a way to controll the r g b pins independently, we can do this via a
 Solution: Use MOSFETs (N-channel MOSFETs like IRLB8721) to control each color channel.