# Cozynest

## Code/Technology Requirements

<br>

<details>

### **R1. Create your app using Ruby on Rails.**

Yes

<br>

### **R2. Use Postgresql database in development and production.**

Yes

<br>

### **R3. Your app will have authentication (eg. Devise).**

Yes

<br>

### **R4. Your app will have authorisation (i.e. users have restrictions on what they can see and edit).**

User role, Shelter and Guardian, has been added as a property (enum)

<br>

### **R5. Your app will have some type of file (eg. images) uploading capability.**

Will be implementing AWS S3 to store user uploaded images

<br>

### **R6. Your app is to be deployed to Heroku (recommended) or AWS.**

Deployed via Heroku and AWS for active storage

</details>

<br>

## README document

### **R7. What Problem are you trying to solve by building Cozynest?**

The population of pet owners has increased a lot under the influence of the COVID-19 as lots of people spent their time at home during the lockdown, but there is always been people who abandon their beloved pets. Even if those pets are rescued, the spaces within the organisations are very limited and unfortunately, Euthanasia against those unadopted pets are inevitable in the end.

ASPCA, Ameciran Society for the Prevention of Curelty to Animals, states that they do "recognizes the inevitable necessity for Euthanasia in certian circumstances". Moreover, they "believe that unwanted pets deserve a dignified, painless death rather than suffer from such cruelties as malnutrition, disease of trauma".

<br>

### **R8. Why is the problem stated above needs to be solved?**

It is convincing that the capacity of the fcaility is very limited but, just like us, humanbeings, animals are also a part of the Earth, a living creature. We do not have a right, authority and privilege to claim their lives.

The idea of Cozynest is to prevent such unwanted happenings as much as possible by connecting the shelters, the organisations, with the individual temporary guardians who could foster the pets before they being adopted to a new family.

<br>

### **R9. Link to the deployed application**

https://cozynest.herokuapp.com/

<br>

### **R10. Link to the GitHub repository**

https://github.com/Pogeun/cozynest

<br>

### **R11. Description of Cozynest:**
#### **Purpose**

Cozynest is designed for two purposes:
1. To free up the spaces within the shelter so that they could admit more animals
2. To secure the time for existing pets to find a new family

<br>

#### **Functionality / features**

Cozynest has following features:
1. User authentication and authorization
2. Registering the animals to Cozynest's database which will be displayed to the public users
3. Send a foster request which users could leave a comments to appeal their story and background
4. Reviewing foster requests and picking one from potential candidates
5. Terminating a fostering process
6. Creating a review about the animal that users have fostered
7. Donation system

<br>

#### **Sitemap**

<center><img src="./app/assets/images/readme/sitemap.png" style="width: 700px;" alt="sitemap">

Sitemap</center>

<br>

#### **Screenshots**

<center><img src="./app/assets/images/readme/index.png" style="width: 700px;" alt="index">

index</center>

<br>

<center><img src="./app/assets/images/readme/about.png" style="width: 700px;" alt="about">

about</center>

<br>

<center><img src="./app/assets/images/readme/contact.png" style="width: 700px;" alt="contact">

contact</center>

<br>

<center><img src="./app/assets/images/readme/registration (signup).png" style="width: 700px;" alt="registration (signup)">

registration (signup)</center>

<br>

<center><img src="./app/assets/images/readme/registration (edit).png" style="width: 700px;" alt="registration (edit)">

registration (edit)</center>

<br>

<center><img src="./app/assets/images/readme/pets.png" style="width: 700px;" alt="pets">

pets</center>

<br>

<center><img src="./app/assets/images/readme/pet (shelter).png" style="width: 700px;" alt="pet (shelter)">

pet (shelter)</center>

<br>

<center><img src="./app/assets/images/readme/pet (guardian).png" style="width: 700px;" alt="pet (guardian)">

pet (guardian)</center>

<br>

<center><img src="./app/assets/images/readme/foster request.png" style="width: 700px;" alt="foster request">

foster request</center>

<br>

<center><img src="./app/assets/images/readme/foster requests per pet.png" style="width: 700px;" alt="foster requests per pet">

foster requests per pet</center>

<br>

<center><img src="./app/assets/images/readme/donation.png" style="width: 700px;" alt="donation">

donation</center>

<br>

#### **Target audience**

The major target audiences are:
1. Shelter (The organisation)
2. Guardian (The fosterer)
3. People who are willing to adopt a pet

<br>

#### **Tech stack (e.g. html, css, deployment platform, etc)**

<b>Language:</b>
- Ruby
- HTML
- CSS (SCSS)
- JavaScript

<b>Ruby gems:</b>
- Ruby on Rails
- Devise
- Stripe
- Bootstrap
- mail_form
- aws-sdk-s3

<b>Deployment platform:</b>
- Heroku
- AWS S3

<b>Etc.</b>
- PostgreSQL (Database)
- Mailgun

<br>

### **R12. User stories**

<b>Shelter</b>
- As a shelter representative, I can register animals to the Cozynest so that those animals could free up the space within the organisation.
- As a shelter representative, I can register animals to the Cozynest so that those animals could be adopted to a new family.
- As a shelter representative, I can review foster request and select potential candidates for our registered animal so they can be fostered.

<b>Guardian</b>
- As a guardian, I can submit foster request so that they could foster an animal whilst the shelter representatives find a new family.
- As a guardian, I can terminate the fostering so that they could return the animal to the shelter.
- As a guardian, I can leave a review regarding the pet so that they could leave a positive comments on pet for future references.

<b>Potential adopter</b>
- As a potential adopter, I can take a look on Cozynest so that I could adopt a pet.

<br>

### **R13. Wireframe**

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Index.png" style="width: 700px;" alt="index">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Index.png" style="width: 480px;" alt="index">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Index.png" style="width: 400px;" alt="index">
<br>

Index</center>

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Registration.png" style="width: 700px;" alt="registration">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Registration.png" style="width: 480px;" alt="registration">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Registration.png" style="width: 400px;" alt="registration">
<br>

Registration</center>

Generic design is shared for all registration pages like edit account, reset password and sign in.

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Pets.png" style="width: 700px;" alt="pets">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Pets.png" style="width: 480px;" alt="pets">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Pets.png" style="width: 400px;" alt="pets">
<br>

Pets</center>

Generic design is shared for pets index page and user specific pets page.

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Pet%20(Shelter).png" style="width: 700px;" alt="pet (shelter)">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Pet%20(Shelter).png" style="width: 480px;" alt="pet (shelter)">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Pet%20(Shelter).png" style="width: 400px;" alt="pet (shelter)">
<br>

Pet (shelter)</center>

Review foster request and Delete buttons are removed once the pet is fostered.

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Pet%20(Guardian).png" style="width: 700px;" alt="pet (guardian)">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Pet%20(Guardian).png" style="width: 480px;" alt="pet (guardian)">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Pet%20(Guardian).png" style="width: 400px;" alt="pet (guardian)">
<br>

Pet (Guardian)</center>

Foster request button is removed once the pet is fostered and replaced to End fostering button if the guardian is the current user.

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Fostering.png" style="width: 700px;" alt="fostering">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Fostering.png" style="width: 480px;" alt="fostering">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Fostering.png" style="width: 400px;" alt="fostering">
<br>

Fostering</center>

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Foster%20requests.png" style="width: 700px;" alt="foster requests">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Foster%20requests.png" style="width: 480px;" alt="foster requests">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Foster%20requests.png" style="width: 400px;" alt="foster requests">
<br>

Foster requests</center>

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Foster%20request%20details.png" style="width: 700px;" alt="foster request details">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Foster%20request%20details.png" style="width: 480px;" alt="foster request details">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Foster%20request%20details.png" style="width: 400px;" alt="foster request details">
<br>

Foster request details</center>

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Donation.png" style="width: 700px;" alt="donation">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Donation.png" style="width: 480px;" alt="donation">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Donation.png" style="width: 400px;" alt="donation">
<br>

Donation</center>

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20About.png" style="width: 700px;" alt="about">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20About.png" style="width: 480px;" alt="about">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20About.png" style="width: 400px;" alt="about">
<br>

About</center>

<br>

<center><img src="./app/assets/images/readme/wireframe/Web%20-%20Contact.png" style="width: 700px;" alt="contact">
<br>
<img src="./app/assets/images/readme/wireframe/iPad%20Pro%2012.9%20-%20Contact.png" style="width: 480px;" alt="contact">
<br>
<img src="./app/assets/images/readme/wireframe/iPhone%2013,%2012%20Pro%20Max%20-%20Contact.png" style="width: 400px;" alt="contact">
<br>

Contact</center>

<br>

### **R14. Entity Relationship Diagram**

<center><img src="./app/assets/images/readme/Entity Relationship Diagram.png" style="width: 700px;" alt="entity relationship diagram">

Entity Relationship Diagram (ERD)</center>

<br>

### **R15. Explain the different high-level components (abstractions) in your app**

<br>

### **R16. Detail any third party services that your app will use**

<br>

### **R17. Describe your projects models in terms of the relationships (active record associations) they have with each other**

<br>

### **R18. Discuss the database relations to be implemented in your application**

<br>

### **R19. Provide your database schema design**

<br>

### **R20. Describe the way tasks are allocated and tracked in your project**

<br>

## Slide deck

### **R21. An outline of the problem you were trying to solve by building this particular marketplace app, and why it’s a problem that needs solving**

<br>

### **R22. A walkthrough of your app**