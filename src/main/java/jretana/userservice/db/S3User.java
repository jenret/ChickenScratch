package jretana.userservice.db;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;

public class S3User {
    AWSCredentials credentials = new BasicAWSCredentials(
            "<AWS accesskey>",
            "<AWS secretkey>"
    );

}
