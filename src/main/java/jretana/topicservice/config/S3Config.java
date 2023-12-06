package jretana.topicservice.config;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

public class S3Config {

    private final String ACCESS_KEY = System.getenv("AWS_ACCESS_KEY");
    private final String SECRET_KEY = System.getenv("AWS_SECRET_KEY");

    public AmazonS3 getS3Client() {
        final BasicAWSCredentials ChickenCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

        return AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(ChickenCredentials)).withRegion(Regions.US_WEST_1).build();
    }
}
