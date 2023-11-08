package com.java.jsp;


import java.util.regex.Pattern;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

public class PatientController {

	private PatientDaoImpl daoImpl;

	public PatientDaoImpl getDaoImpl() {
		return daoImpl;
	}

	public void setDaoImpl(PatientDaoImpl daoImpl) {
		this.daoImpl = daoImpl;
	}

//	// Define the isLeapYear method as a separate private method within the class
//	private boolean isLeapYear(int year) {
//		return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
//	}

	public String addPatientValid(Patient patient) {
		System.out.println(patient);
//		System.out.println(daoImpl);
		System.out.println("addPatientValid is Hittingggggggggg");
		System.out.println(addValid(patient));
		if (addValid(patient)) {
			return daoImpl.addPatient(patient);
		}
		return "";

	}

	public boolean addValid(Patient patient) {
		FacesContext context = FacesContext.getCurrentInstance();
		String firstName = "^[A-Za-z\\s]+$";
		String lastName = "^[A-Za-z\\s]+$";
		String userName = "^[^\\s]{8,10}$";
		String phoneno = "^(\\+91|91|0)?[6789]\\d{9}$";
		String email = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
		String password = "^(?=.*[A-Z])(?=.*[a-z0-9])(?=.*[^a-zA-Z0-9]).{8,18}$";

//FIRSTNAME
		boolean flag = true;
		System.out.println("FirstName Length is " + patient.getFirstName().length());
		if (patient.getFirstName().length() <= 0) {
			context.addMessage("form:firstName", new FacesMessage("FirstName Cannot be Empty..."));
			System.out.println("FirstName Null Failed...");
			flag = false;
		}

		if (!Pattern.matches(firstName, patient.getFirstName())) {
			context.addMessage("form:firstName", new FacesMessage("Invalid FirstName. Only letters are allowed."));
			System.out.println("FirstName Failed...");
			flag = false;
		}

//PASSWORD

		if (patient.getPassword().length() <= 0) {
			context.addMessage("form:Password", new FacesMessage("Password Cannot be Empty..."));
			System.out.println("Password Null Failed...");
			flag = false;
		} else if (!Pattern.matches(password, patient.getPassword())) {
			context.addMessage("form:Password", new FacesMessage("Invalid Password format.Hint: @Abcde1234"));
			System.out.println("Password failed.");
			flag = false;
		}

//USERNAME		
		if (!Pattern.matches(userName, patient.getUserName())) {
			context.addMessage("form:userName", new FacesMessage("Username Contains min 8 characters."));
			System.out.println("UserName Failed...");
			flag = false;
		}
//LASTNAME
		if (patient.getLastName().length() <= 0) {
			context.addMessage("form:lastName", new FacesMessage("LastName Cannot Be Empty."));
			System.out.println("LastName Failed...");
			flag = false;
		}
		if (!Pattern.matches(lastName, patient.getLastName())) {
			context.addMessage("form:lastName", new FacesMessage("Invalid LastName. Only letters are allowed."));
			System.out.println("LastName Failed...");
			flag = false;
		}

//PHONENUMBER

		if (patient.getPhoneno().length() <= 0) {
			context.addMessage("form:phoneno", new FacesMessage("Enter Your Phone Number."));
			System.out.println("PhoneNo Failed...");
			flag = false;
		}

		if (!Pattern.matches(phoneno, patient.getPhoneno())) {
			context.addMessage("form:phoneno", new FacesMessage("Invalid Phone Number."));
			System.out.println("PhoneNo Failed...");
			flag = false;
		}
//GMAIL
		if (patient.getEmail().length() <= 0) {
			context.addMessage("form:email", new FacesMessage("Email Cannot Be Empty"));
			System.out.println("Email Failed...");
			flag = false;
		}
		if (!Pattern.matches(email, patient.getEmail())) {
			context.addMessage("form:email", new FacesMessage("Invalid Email."));
			System.out.println("Email Failed...");
			flag = false;
		}
//ADDRESS
		if (patient.getAddress().length() <= 0) {
			context.addMessage("form:address", new FacesMessage("Please Enter Your Address."));
			System.out.println("Enter Your Address");
			flag = false;
		}
//MEDICALHISTORY

		if (patient.getMedHistory().length() <= 0) {
			context.addMessage("form:medHistory", new FacesMessage("Please Enter Your Medical History."));
			System.out.println("Enter Your MEdHistory");
			flag = false;
		}
//DOB
		
		  if (patient.getDob() == null) { 
			  context.addMessage("form:dob", new  FacesMessage("DOB cannot be empty."));
			  System.out.println("Enter Your DOB");
		  flag = false; 
		  }
		

//        if (patient.getDob() == null) {
//            context.addMessage("form:dob", new FacesMessage("DOB cannot be empty."));
//            System.out.println("Enter Your DOB");
//            flag = false;
//        } 
//            Calendar cal = Calendar.getInstance();
////            cal.setTime(patient.getDob());
//            int year = cal.get(Calendar.YEAR);
//            int month = cal.get(Calendar.MONTH);
//            int day = cal.get(Calendar.DAY_OF_MONTH);
//
//            if (month == Calendar.FEBRUARY) {
//                if (day > 29 || (day == 29 && !isLeapYear(year))) {
//                    context.addMessage("form:dob", new FacesMessage("Invalid date for February."));
//                    flag = false;
//         
//            }
//        }

//GENDER
		if (patient.getGender() == null || patient.getGender().isEmpty()) {
			context.addMessage("form:gender", new FacesMessage("Select Gender."));
			System.out.println("Select Gender Failed...");
			flag = false;
		}

		return flag;
	}
}
