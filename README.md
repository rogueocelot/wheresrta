# wheresrta  

![Logo](app/assets/images/logo.png.png?raw=true)

wheresrta.net uses the GTFS-RT data provided by Cleveland's RTA to track the real time location of Cleveland Transit.  

## Running  

### Setup  

To install the required gems and start the server do:  
```bash
bundle install
bin/rails server
```  

### Running:  
To update the database with the current location do:  
```bash
rake update_transit:update
```
I have this set to a 2 minute cron job (I notice rate limiting when I attempt 1 minute)  