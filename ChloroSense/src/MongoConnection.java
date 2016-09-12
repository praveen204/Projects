import com.mongodb.MongoClient;
import  com.mongodb.MongoException;
import com.mongodb.WriteConcern;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.client.MongoCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBCollection;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoDatabase;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bson.Document;

import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.Block;

import cs.dao.ConnectionDao;



public class MongoConnection  {
    
    public void connect()
   throws ServletException, IOException {
        
        System.out.println("somehting");
        
        

    MongoClient mongoClient = new MongoClient("localhost",27017);
    MongoDatabase database = mongoClient.getDatabase("demotest");
    MongoCollection collection= database.getCollection("name");
    database.getCollection("name").insertOne(new Document()
                .append("street", "2 Avenue")
                .append("zipcode", "10075")
                .append("building", "1480")
                .append("coord", "test"));

    FindIterable<Document> iterable = database.getCollection("name").find();
    iterable.forEach(new Block<Document>() {
            
            public void apply(final Document document) {
                System.out.println(document.toString());
                
                StringTokenizer st=new StringTokenizer(document.toString(),",");
                while(st.hasMoreTokens())
                { String s=st.nextToken();
                	s=s.substring(s.indexOf("=")+1);
                if(s.contains("}}"))
                {
                	s=s.replace("}}", "");
                }
                System.out.println(s);
                }
            }
            
           
    
    
        
    
    });
}
    public static void main(String[] args) {
    	MongoConnection mc=new MongoConnection();
    	try {
			mc.connect();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}