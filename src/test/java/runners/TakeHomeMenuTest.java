package runners;

import com.intuit.karate.junit5.Karate;

public class TakeHomeMenuTest {
    String[] featurePaths = {"classpath:TakeHomeAPIFeatures"};

    @Karate.Test
    Karate testTakeHomeMenu() {
        return Karate.run(featurePaths)
                //.tags()
                .karateEnv("local");
    }
}
