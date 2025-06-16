package lk.ijse.gdse72.util;

import java.util.UUID;

//public class IdGenerator {
//
//    public static String generateUserId() {
//        return "USER_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
//    }
//
//    public static String generateComplaintId() {
//        return "CMP_" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
//    }
public class IdGenerator {
    private static int userCounter = 1;
    private static int complaintCounter = 1;

    public static String generateUserId() {
        return String.format("USER_%03d", userCounter++);
    }

    public static String generateComplaintId() {
        return String.format("CMP_%03d", complaintCounter++);
    }
}

