
package com.flybeyond.dao;

import com.flybeyond.util.DBConnection;
import com.flybeyond.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    public boolean loginAdmin(String username, String password) {

        String sql = "SELECT password FROM admins WHERE username = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {
                    String storedPassword = rs.getString("password");

                    return PasswordUtil.verifyPassword(
                            password, storedPassword);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
