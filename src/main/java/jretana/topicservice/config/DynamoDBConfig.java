package jretana.topicservice.config;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.document.DynamoDB;
import com.amazonaws.services.dynamodbv2.document.Table;

public class DynamoDBConfig {

    private final String ACCESS_KEY = System.getenv("AWS_ACCESS_KEY");
    private final String SECRET_KEY = System.getenv("AWS_SECRET_KEY");

    public AmazonDynamoDB getDynamoDBClient() {
        final BasicAWSCredentials ChickenCredentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);

        return AmazonDynamoDBClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(ChickenCredentials)).withRegion(Regions.US_WEST_1).build();
    }

    public Table getDynamoDBTable(String tableName) {
        DynamoDB dynamoDB = new DynamoDB(getDynamoDBClient());

        return dynamoDB.getTable(tableName);
    }
}
