package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.core.Result;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

public class TakeHomeMenuTest {
    String[] featurePaths = {"classpath:TakeHomeAPIFeatures"};//Multiple folders/feature files can be added

    @Karate.Test
    Karate testTakeHomeMenu() {
        return Karate.run(featurePaths)
                //.tags()
                .karateEnv("local");
    }

}
