
package com.flybeyond.dao;

import com.flybeyond.model.Booking;
import com.flybeyond.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    public boolean createBooking(
            int userId,
            int destinationId,
            Date travelDate,
            int numberOfPersons,
            String specialRequests) {

        String sql = "INSERT INTO bookings " +
                "(user_id, destination_id, travel_date, number_of_persons, special_requests, status) " +
                "VALUES (?, ?, ?, ?, ?, 'Pending')";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setInt(2, destinationId);
            ps.setDate(3, travelDate);
            ps.setInt(4, numberOfPersons);
            ps.setString(5, specialRequests);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Booking> getBookingsByUserId(int userId) {

        List<Booking> bookings = new ArrayList<>();

        String sql = "SELECT b.id, b.user_id, d.name AS destination, " +
                "b.travel_date, b.number_of_persons, " +
                "b.special_requests, b.status " +
                "FROM bookings b " +
                "JOIN destinations d ON b.destination_id = d.id " +
                "WHERE b.user_id = ? ORDER BY b.id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Booking booking = new Booking();

                    booking.setId(rs.getInt("id"));
                    booking.setUserId(rs.getInt("user_id"));
                    booking.setDestination(rs.getString("destination"));
                    booking.setTravelDate(rs.getDate("travel_date"));
                    booking.setTravellers(rs.getInt("number_of_persons"));
                    booking.setSpecialRequests(rs.getString("special_requests"));
                    booking.setBookingStatus(rs.getString("status"));

                    bookings.add(booking);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }
}
