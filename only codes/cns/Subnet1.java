import java.io.*;
import java.net.InetAddress;
public class Subnet1 {
    public static void main(String[] args) throws IOException {
        System.out.println("\t ENTER IP:");
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String ip = br.readLine();
        String checkclass = ip.substring(0, 3);
        int cc = Integer.parseInt(checkclass);
        String mask = null;
        if(cc>0)
        {
            if(cc<=127)
            {
                mask = "255.0.0.0";
        System.out.println("\t Class A IP Address");
        System.out.println("\t SUBNET MASK:\t "+mask);
            }
            if(cc>=128 && cc<=191)
            {
                mask = "255.255.0.0";
        System.out.println("\t Class B IP Address");
        System.out.println("\t SUBNET MASK:\t "+mask);
            }
            if(cc>=192 && cc<=223)
            {
                mask = "255.255.255.0";
        System.out.println("\t Class C IP Address");
        System.out.println("\t SUBNET MASK:\t "+mask);
            }
        if(cc>=224 && cc<=239)
            {
        mask = "255.0.0.0";
                System.out.println("\t  Class D IP Address Used for multicasting");
            }
            if(cc>=240 && cc<=254)
            {
        mask = "255.0.0.0";
                System.out.println("\t Class E IP Address Experimental Use");
            }
        }
        String networkAddr="";
    String lastAddr="";
        String[] ipAddrParts=ip.split("\\.");
        String[] maskParts=mask.split("\\.");

        for(int i=0;i<4;i++){
        int x=Integer.parseInt(ipAddrParts[i]);
        int y=Integer.parseInt(maskParts[i]);
        int z=x&y;
        networkAddr+=z+".";
    int w=z|(y^255);
    lastAddr+=w+".";
        }
    System.out.println("\t First IP of block: "+networkAddr);
    System.out.println("\t Last IP of block: "+lastAddr);
   }
}