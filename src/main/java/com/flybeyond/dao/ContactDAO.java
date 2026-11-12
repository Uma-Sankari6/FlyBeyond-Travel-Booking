
package com.flybeyond.dao;

import com.flybeyond.model.ContactMessage;
import com.flybeyond.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactDAO {

    public boolean saveMessage(ContactMessage contact) {

        String sql = "INSERT INTO contact_messages "
                + "(name, email, subject, message) "
                + "VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, contact.getName());
            ps.setString(2, contact.getEmail());
            ps.setString(3, contact.getSubject());
            ps.setString(4, contact.getMessage());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
