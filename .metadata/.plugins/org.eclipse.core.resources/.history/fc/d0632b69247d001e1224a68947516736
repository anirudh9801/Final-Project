package com.java.jsp;

import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class PatientDaoImpl implements PatientDao {
	SessionFactory sf;
	Session session;

	@Override
	public String addPatient(Patient patient) {
		String uhid = generateUHID();
		System.out.println("UH Id i  " + uhid);
		patient.setUhid(uhid);
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Transaction trans = session.beginTransaction();

		// Set the status to "Pending" by default
		patient.setStatus("Pending");
		
	


		// Save the Patient entity
		session.save(patient);
		trans.commit();
		session.close();

		String otp = generateOtp(8);

		String body = "Welcome to Mr/Miss " + patient.getFirstName() + "\r\n" + "Your OTP Generated Successfully"
				+ "\r\n" + "OTP is " + otp;

		MailSend.mailOtp(patient.getEmail(), "Otp Sent Successfully...", body);

		session = sf.openSession();
		Transaction trans2 = session.beginTransaction();

		Login login = new Login();
		login.setUhid(patient.getUhid());
		login.setUsername(patient.getUserName());
		login.setOtp(otp);
		login.setEmail(patient.getEmail());

		session.save(login);

		trans2.commit();
		session.close();

		return "Welcome.jsp?faces-redirect=true";
	}

//    public static String generateOtp(int length) {
//        String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
//        SecureRandom secureRandom = new SecureRandom();
//        StringBuilder otp = new StringBuilder(length);
//
//        for (int i = 0; i < length; i++) {
//            int randomIndex = secureRandom.nextInt(characters.length());
//            char randomChar = characters.charAt(randomIndex);
//            otp.append(randomChar);
//        }
//
//        return otp.toString();
//    }
	public static String generateOtp(int length) {
		String characters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		SecureRandom secureRandom = new SecureRandom();
		StringBuilder otp = new StringBuilder(6);

		for (int i = 0; i < 6; i++) {
			int randomIndex = secureRandom.nextInt(characters.length());
			char randomChar = characters.charAt(randomIndex);
			otp.append(randomChar);
		}

		return otp.toString();
	}

//
//    private static int uhidCounter = 1;
//
//    private static String generateUHID() {
//        // Generate UHID in the format "IN0001", "IN0002", and so on
//        String uhid = String.format("IN%04d", uhidCounter);
//        uhidCounter++;
//        return uhid;
//    }

	private static String generateUHID() {
		SessionFactory sf;
		Session session;
		sf = SessionHelper.getConnection();
		session = sf.openSession();
		Transaction trans = session.beginTransaction();

		// Fetch the last UHID from the table
		Query query = session.createQuery("SELECT MAX(p.uhid) FROM Patient p");
		String lastUHID = (String) query.uniqueResult();

		if (lastUHID == null) {
			lastUHID = "IN0000"; // Set an initial value if the table is empty
		}

		// Extract the numeric part and increment it
		int numericPart = Integer.parseInt(lastUHID.substring(2));
		numericPart++;

		// Generate the new UHID with the incremented numeric part
		String newUHID = String.format("IN%04d", numericPart);
		System.out.println(newUHID);

		trans.commit();
		session.close();

		return newUHID;
	}

	}



