package runners;

import com.intuit.karate.junit5.Karate;

public class TakeHomeMenuTest {
    String[] featurePaths = {"classpath:TakeHomeAPIFeatures"};//multiple feature files/folders can be added to the array


    @Karate.Test
    Karate testTakeHomeMenu() {
        return Karate.run(featurePaths)
                //.tags()
                //.karateEnv("local")
                .relativeTo(getClass());
    }
}
