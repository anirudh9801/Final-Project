<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<f:view>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Body styles */
            body {
                text-align: center;
                font-family: "Poppins"; /* Set the font */
                color: #000;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh; /* Center the form vertically */
                margin: 0; /* Remove default margin to center horizontally */
                background-image: url('drimg.jpg'); /* Replace 'your-image-url.jpg' with the URL of your image */
                background-size: cover; /* Adjust the size of the background image */
                background-repeat: no-repeat; /* Prevent the image from repeating */
                background-attachment: fixed; /* Keep the background fixed while scrolling */
            }

            /* Form container styles */
            #form {
                font-family: "Poppins"; /* Set the font */
                color: #000;
                max-width: 1000px;
                margin: 0 auto; /* Center the form horizontally */
                padding: 10px;
                background-color: #f2f2f2;
                border-radius: 3px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border: 2px solid #000;
            }

            /* Heading styles */
            .h2-container {
                background-color: #333; /* Set the background color to a greyish-black color */
                padding: 10px; /* Add padding to create a margin with the background color */
            }
            h2 {
                font-size: 24px;
                margin: 2px 0;
                color: white; /* Set the color to white */
            }

            /* Label styles */
            label {
                display: block;
                margin-top: 10px;
                font-weight: bold;
            }

            /* Input field styles */
            input[type="text"],
            select {
                width: 100%; /* Make the input elements full-width (adjust as needed) */
                padding: 5px; /* Decrease the padding to make them smaller */
                margin-top: 5px 0;
                border: 1px solid #ccc;
                border-radius: 3px;
                height: 25px; /* Set a specific height for the input elements */
            }
            input[type="text"] {
                margin-bottom: 0px;
                padding: 5px;
                font-size: 16px; /* Adjust the font size as needed */
                font-weight: normal; /* Adjust the font weight (e.g., bold, normal) */
            }

            /* Create a box-style container for "Address" and "Medical History" fields */
            .box-container {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            /* Style for "Address" and "Medical History" fields */
            .box-field {
                width: 48%;
            }

            /* Message styles */
            .message {
                color: red;
            }

            /* CSS for First Name and Last Name to be displayed adjacent */
            .name-container {
                display: flex;
            }

            .name-field {
                width: 48%;
                display: inline-block;
            }

            /* Button styles */
            .my-button {
                background-color: #007bff !important;
                color: #fff !important;
                padding: 10px 20px;
                border: 1px solid #000 !important;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 10px;
            }

            /* Link styles */
            a {
                color: #007bff;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h:form id="form">
        <div class="h2-container">
            <h2>ENROLLMENT</h2>
            </div>
            <hr />

            <%-- Wrap First Name and Last Name in a div to display them side by side --%>
            <div class="name-container">
                <div class="name-field">
                    <label>First Name</label>
                    <h:inputText id="firstName" value="#{patient.firstName}" />
                    <span class="message"><h:message for="form:firstName"></h:message></span>
                </div>

                <div class="name-field">
                    <label>Last Name</label>
                    <h:inputText id="lastName" value="#{patient.lastName}" />
                    <span class="message"><h:message for="form:lastName"></h:message></span>
                </div>
            </div>
            <div class="name-field">
                <label>Gender:</label>
                <h:selectOneMenu id="gender" value="#{patient.gender}">
                    <f:selectItem itemLabel="Select Gender" itemValue="" />
                    <f:selectItem itemLabel="MALE" itemValue="MALE" />
                    <f:selectItem itemLabel="FEMALE" itemValue="FEMALE" />
                    <f:selectItem itemLabel="OTHER" itemValue="OTHER" />
                </h:selectOneMenu>
                <span class="message"><h:message for="form:gender" /></span>
            </div>

            <div class="name-field">
                <label>Date of Birth:</label>
                <h:inputText id="dob" value="#{patient.dob}">
                    <f:convertDateTime pattern="dd/mm/yyyy" />
                </h:inputText>

                <h:panelGroup>
                    <span class="message"><h:message for="form:dob" /></span>
                </h:panelGroup>
            </div>

            <div class="name-field">
                <label>UserName</label>
                <h:inputText id="userName" value="#{patient.userName}" />
                <br />
                <br />
                <span  class="message"><h:message for="form:userName" /></span> 
            </div>

            <div class="name-field">
                <label>Password</label>
                <h:inputText id="Password" value="#{patient.password}" />
                <br />
                <br />
                <span class="message"><h:message for="form:Password" /></span>
            </div>
            
            <div class="name-field">
            <label>Email</label>
            <h:inputText id="email" value="#{patient.email}" />
            <span class="message"><h:message for="form:email" /></span>
            </div>
            
            <div class="name-field">
            <label>Phone Number</label>
            <h:inputText id="phoneno" value="#{patient.phoneno}" />
            <span class="message"><h:message for="form:phoneno"></h:message></span>
            </div>
            
            
            <div class="box-container">
                <div class="box-field">
                    <label>Address</label>
                    <h:inputText id="address" value="#{patient.address}" />
                    <span class="message"><h:message for="form:address"></h:message></span>
                    <br />
                    <br />
                </div>
                
                <div class="box-field">
                    <label>Medical History</label>
                    <h:inputText id="medHistory" value="#{patient.medHistory}" />
                    <span class="message"><h:message for="form:medHistory"></h:message></span>
                    <br />
                    <br />
                </div>
            </div>
            
            <div class="button-container">
         <h:commandButton styleClass="my-button" action="#{patientController.addPatientValid(patient)}" value="Sign Up" />


                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
                <input Class="my-button" type="reset" value="Reset">
            </div>

            <br/>
            <a href="login.jsp">Already have an account?</a>
        </h:form>
    </body>
    </html>
</f:view>
