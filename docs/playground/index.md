# The Playground

Let's get familiar with the interface. Please complete the following!
- Successfully Log in to your Graylog instance
- Checkout the Datasets Tab
- Checkout the Webhooks Tab

# Accessing Graylog Web Interface

There are multiple ways of accessing the Graylog URL specific to your lab.  
## Using the public IP
Your Graylog instance URL is displayed on the Graylog Server launch screen.  It should be a variation of: 
`https://YourUserName-lab.logfather.org`


## Using the Graylog tab from the Graylog server

![](images/intro-graylog01.png)


# Logging In

Navigate to your personalized Graylog instance. 

You can use a separate browser tab on your own computer or the windows desktop included in this lab environment (if applicable).

# Your Lab Details

| Username: |   | `admin` |
|:-|---|:-|
| Password: |   | `yabba dabba doo`|

(Note the spaces)

<br>

# Activity: Data Sets!
Open the Logs Tab from the Graylog server

![](images/intro-datasets01.png)

These will be the datasets used within the CTF Challenges. They should look very similar to the below 

![](images/intro-datasets02.png)


Expect to see questions specifying specific datasets!
![](images/intro-ctfdataset.png)

<br>


# Simulated Log Data

![Log Preview](../images/logs.png)

This is how the screen appears when logs are being continuously simulated.  **This may flash by very quickly, such as the demo you just performed**.  

<br>

# Activity: Alternate Access Methods

The Graylog Server virtual machine within the lab is running Graylog and some additional services.

Every machine also has a public IP address and DNS name that can be found by clicking the gear next to the virtual machine name and selecting *Machine Info*.  This information can be used for the variety of SSH or Log Ingestion tasks throughout your training.

**Try to access the Graylog Web Interface in a different method than you are currently using.**

Use whichever method of accessing the material works best for you!

<br>

# Viewing Log Data

Once you have clicked on a dataset, you can view the incoming log from the **SEARCH** tab.  The default settings for this search should be sufficient to view any logs unless otherwise stated. 


Clicking on a message from the **Default Stream** table will expand the message showing all of the data and fields within that message.  

![Log Preview](images/intro-viewlogs.png)