package utilities;

import java.util.Random;

public class RandomDataGenerator {
    private static final Random random = new Random();

    private static String generatedId;
    private static String generatedName;

    public static String generateRandomId() {
        generatedId = String.valueOf(10 + random.nextInt(1000));// Generate a random number between 10 and 999
        return generatedId;
    }

    public static String generateRandomPrice() {
        return "$"+ (5 + random.nextInt(50));// Generate a random number between 5 and 49
    }

    public static String generateRandomName() {
        generatedName = "Dish-" + generatedId;
        return generatedName;
    }

    public static String generateRandomImage() {
        return generatedName + ".png";
    }
}