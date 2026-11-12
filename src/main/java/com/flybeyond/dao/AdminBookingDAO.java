
package com.flybeyond.dao;

import com.flybeyond.model.Booking;
import com.flybeyond.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AdminBookingDAO {

    public List<Booking> getAllBookings() {

        List<Booking> bookings = new ArrayList<>();

        String sql = "SELECT * FROM bookings ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Booking booking = new Booking();

                booking.setId(rs.getInt("id"));
                booking.setUserId(rs.getInt("user_id"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setEmail(rs.getString("email"));
                booking.setDestination(rs.getString("destination"));
                booking.setTravelDate(rs.getDate("travel_date"));
                booking.setTravellers(rs.getInt("travellers"));
                booking.setSpecialRequests(
                        rs.getString("special_requests"));
                booking.setBookingStatus(
                        rs.getString("booking_status"));

                bookings.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }

    public boolean updateBookingStatus(int bookingId, String status) {

        String sql = "UPDATE bookings SET booking_status = ? WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2, bookingId);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
