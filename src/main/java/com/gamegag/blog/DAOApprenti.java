package com.gamegag.blog;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@SuppressWarnings({ "unchecked", "rawtypes" })
public class DAOApprenti {

	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * @Transactional annotation below will trigger Spring Hibernate transaction
	 *                manager to automatically create a hibernate session. See
	 *                src/main/webapp/WEB-INF/servlet-context.xml
	 */
	@Transactional
	public List<Apprenti> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List apprentis = session.createQuery("from Apprenti").list();
		return apprentis;
	}
}