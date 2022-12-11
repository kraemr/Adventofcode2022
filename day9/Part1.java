import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Vector;
import java.math.*;
import java.util.AbstractMap;
public class Part1 {

static int tailx = 0;
static int taily = 0;
static int headx = 0;
static int heady = 0;    
static int poscount = 0;

static Vector<AbstractMap.SimpleEntry<Integer, Integer>> tailpositions;

static void move(String movedir,int n){
    // if the head is 2 steps away from tailx taily
    int deltax = headx - 0;
    int deltay = heady - 0;
    int start_headx = 0;
    int start_heady = 0; 
    AbstractMap.SimpleEntry<Integer, Integer> entry;
    for(int i = 0; i < n; i++){
    
        
        start_headx = headx;
        start_heady = heady; 
       

        switch (movedir){
            case "U": 
            heady++;
            ;break;
            case "D": 
            heady--;
            ;break;
            case "L": 
            headx--;
            ;break;
            case "R": 
            headx++;
            ;break;
            default:;
        }
        deltax = headx - tailx;
        deltay = heady - taily;
        if(deltax < 0)deltax *= -1;
        if(deltay < 0)deltay *= -1;

        if(deltax >=2 || deltay >= 2)
        {
            tailx = start_headx;
            taily = start_heady;
        }
        entry  = new AbstractMap.SimpleEntry<Integer,Integer>(tailx, taily);
        if(!tailpositions.contains(entry)){
            tailpositions.add(entry);
            poscount++;
        }
    }
}

public static void main(String[] args) {
  

    try{

    File file=new File("input.txt");//creates a new file instance  
    FileReader fr=new FileReader(file);//reads the file  
    BufferedReader br=new BufferedReader(fr);//creates a buffering character input str        
    String line;
    tailpositions = new Vector<>();
    while( (line = br.readLine()) != null)
    {
        String[] spl = line.split(" ", 2);
        move(spl[0],Integer.parseInt(spl[1]));
    }
}
catch(IOException e)
{
e.printStackTrace();
}
System.out.print(poscount);

}
    
}
