
package com.flybeyond.dao;

import com.flybeyond.model.Destination;
import com.flybeyond.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DestinationDAO {

    public List<Destination> getAllDestinations() {

        List<Destination> destinations = new ArrayList<>();

        String sql = "SELECT id, name, country, description, image FROM flybeyond_db.destinations ORDER BY id";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Destination d = new Destination();

                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setCountry(rs.getString("country"));
                d.setDescription(rs.getString("description"));
                d.setImage(rs.getString("image"));

                destinations.add(d);
            }

            System.out.println("Destinations loaded: " + destinations.size());

        } catch (Exception e) {
            System.out.println("DESTINATION DATABASE ERROR:");
            e.printStackTrace();
        }

        return destinations;
    }
}
