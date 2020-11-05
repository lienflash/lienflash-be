# Lien Flash
## Turing Mod 4 Capstone project by:
[Nick Edwin](https://github.com/NickEdwin)<br>
[Josh Tukman](https://github.com/Joshua-Tukman)<br>
[Lito White](https://github.com/ljwhite)<br>

# Visual Representation of Schema 
This diagram shows all of our database tables and how they're linked to one another.  
![Visual Schema](https://i.imgur.com/tdppgaV.png)

# Written In:
  - Ruby 2.5.3
  - Rails 6.0.3.4
  
# Local Setup:
First clone down repo
Then run <code>bundle install</code> for all gems.
Next run <code>rake db:create</code> to set up database. 

# About Lien Flash
This Front End aspect of this app is hosted @ https://lienflash.herokuapp.com/  
Lien Flash is an application that makes a difficult and arduous legal task easy.  
Often after a contractor has finished a job for a client the bill is not fully paid (or sometimes not at all!) When this happens there is a legal process which they can pursue called 'filing a lien'. A lien is a legal claim against the property where the contractor provided goods and/or services. If successful, it gives power to the court to sell the property in order to pay the contractor. There are numerous steps to this process. All of which require the services of expensive lawyers. First the client must have their lawyer file a "Notice of Intent to File a Lien." After that they must then actually File the Lien at the county clerk's office in the county where the property is located. Both of these steps must be completed within a very specific timeline or the contractor's ability to file a lien expires.   
Enter Lien Flash - This application makes it easy for contractors to track multiple jobs with ease. It also enables them to retain a lawyer who specializes in the lien process at a discount. When a job is unpaid and considered 'late', notifications are sent to the contractor (email and text) from the app which give them the option to start the lien process. When they decide to proceed with the lien, the app will keep them updated on every step of the process and the services from the lawyer will be far less than if they went outside of Lien Flash. These multiple scheduled reminders make it impossible for the busy contractor to miss the legal deadlines that would limit his/her ability to get paid. 

# Current known issues / limitations 
Needs admin functionality.  
Needs to increase testing (currently around 97% but 100% is always our goal!)  
Payment processing needs to be added to make app a monthly subscription service.  
