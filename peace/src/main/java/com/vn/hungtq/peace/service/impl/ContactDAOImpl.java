package com.vn.hungtq.peace.service.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.vn.hungtq.peace.entity.Contact;
import com.vn.hungtq.peace.service.ContactDAO;
 

@Transactional
public class ContactDAOImpl implements ContactDAO {
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void saveContact(Contact contact) {
		Session session = this.sessionFactory.getCurrentSession(); 
		contact.setUserId(1);
	    session.save(contact);
	}
}
