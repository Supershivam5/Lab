/**/
 /* 
 */

/**
 * @author ASUS
 *
 */ package Lab_Pass_1;
 import java.io.*;								
 public class SymTab{
 	public static void main(String args[])throws Exception{
 		FileReader FP=new FileReader("C:\\Users\\Asus\\Desktop\\spos_lab\\pass1\\input.txt");
 		BufferedReader bufferedReader = new BufferedReader(FP);
 		String line=null;
 		int line_count=0,LC=0,symTabLine=0,opTabLine=0,litTabLine=0,poolTabLine=0; 
 		 //Data Structures
 		 final int MAX=100;
 		 String SymbolTab[][]=new String[MAX][3];
 		 String OpTab[][]=new String[MAX][3];
 		 String LitTab[][]=new String[MAX][2];
 		 int PoolTab[]=new int[MAX];
 		// integer litTabAddress=0;	//-----------------------------------------------------------------------------------------------//
 		 System.out.println("\t--------------input start------------------------------");
 		    while((line = bufferedReader.readLine()) != null){
 		     	 String[] tokens = line.split("\t");
 		     	if(line_count==0){
 		     		LC=Integer.parseInt(tokens[1]);		//set LC to operand of START
 		     		for(int i=0;i<tokens.length;i++)		//for printing the input program
 		     	 		System.out.print("\t"+tokens[i]+"\t");
 		     	 	System.out.println("");	}
 		     	else{
 			     	 for(int i=0;i<tokens.length;i++) //for printing the input program
 			     	 	System.out.print("\t"+tokens[i]+"\t");
 			     	 System.out.println("");
 			     	if(!tokens[0].equals("")){
 			     		//Inserting into Symbol Table
 			     		SymbolTab[symTabLine][0]=tokens[0];
 			     		SymbolTab[symTabLine][1]=Integer.toString(LC);
 			     		SymbolTab[symTabLine][2]=Integer.toString(1);
 			     		symTabLine++;		}																							
 				else if(tokens[1].equalsIgnoreCase("DS")||tokens[1].equalsIgnoreCase("DC")){
 					//Entry into symbol table for declarative statements
 					SymbolTab[symTabLine][0]=tokens[0];
 			     		SymbolTab[symTabLine][1]=Integer.toString(LC);
 			     		SymbolTab[symTabLine][2]=Integer.toString(1);
 			     		symTabLine++;		}
 				if(tokens.length==3 && tokens[2].charAt(0)=='='){
 					//Entry of literals into literal table
 					LitTab[litTabLine][0]=tokens[2];
 			     		LitTab[litTabLine][1]=Integer.toString(LC);
 			     		litTabLine++;		}
 				else if(tokens[1]!=null){
 						//Entry of Mnemonic in opcode table
 					OpTab[opTabLine][0]=tokens[1];
 					if(tokens[1].equalsIgnoreCase("START")||tokens[1].equalsIgnoreCase("END")||
 						tokens[1].equalsIgnoreCase("ORIGIN")
 						||tokens[1].equalsIgnoreCase("EQU")||tokens[1].equalsIgnoreCase("LTORG")){	/* if Assembler Directive*/
 			     			OpTab[opTabLine][1]="AD";
 						OpTab[opTabLine][2]="R11";					}			     	
 					else if(tokens[1].equalsIgnoreCase("DS")||tokens[1].equalsIgnoreCase("DC")){
 						OpTab[opTabLine][1]="DL";
 						OpTab[opTabLine][2]="R7";					
 					}
 					else{
 						OpTab[opTabLine][1]="IS";
 						OpTab[opTabLine][2]="(04,1)"; 
 					}
 			     	opTabLine++;
 				}
 		        }
 		        line_count++;	 LC++;		}   
 			System.out.println("\t--------------------input end------------------------");  
 			//print symbol table
 			System.out.println("\tSYMBOL TABLE");
 			System.out.println("\t--------------------------");			
 			System.out.println("\tSYMBOL\tADDRESS\tLENGTH");
 			System.out.println("\t--------------------------");			
 			for(int i=0;i<symTabLine;i++)
 				System.out.println("\t"+SymbolTab[i][0]+"\t"+SymbolTab[i][1]+"\t"+SymbolTab[i][2]);
 			System.out.println("\t--------------------------");
 			//print opcode table
 			System.out.println("\tOPCODE TABLE");
 			System.out.println("\t----------------------------");			
 			System.out.println("\tMNEMONIC\tCLASS\tINFO");
 			System.out.println("\t----------------------------");			
 			for(int i=0;i<opTabLine;i++)
 				System.out.println("\t"+OpTab[i][0]+"\t\t"+OpTab[i][1]+"\t"+OpTab[i][2]);
 			System.out.println("\t----------------------------");
 			//print literal table
 			System.out.println("\tLITERAL TABLE");
 			System.out.println("\t-----------------");			
 			System.out.println("\tLITERAL\tADDRESS");
 			System.out.println("\t-----------------");			
 			for(int i=0;i<litTabLine;i++)
 				System.out.println("\t"+LitTab[i][0]+"\t"+LitTab[i][1]);
 			System.out.println("\t------------------");
 			//initialization of POOLTAB
 			for(int i=0;i<litTabLine;i++)
 			{
 				if(LitTab[i][0]!=null && LitTab[i+1][0]!=null ){ /*if literals are present*/
 					
 					if(i==0){																												
 						PoolTab[poolTabLine]=i+1;
 						poolTabLine++;}
 					else if(Integer.parseInt(LitTab[i][1])<(Integer.parseInt(LitTab[i+1][1]))-1){	
 						PoolTab[poolTabLine]=i+2;
 						poolTabLine++;
 					}
 				}
 			}
 			
 			//print pool table																											
 			
 			System.out.println("\tPOOL TABLE");
 			
 			System.out.println("\t-----------------");		
 			
 			System.out.println("\tLITERAL NUMBER");
 			
 			System.out.println("\t-----------------");			
 			
 			for(int i=0;i<poolTabLine;i++)
 				
 				System.out.println("\t"+PoolTab[i]+"\t");
 			
 			System.out.println("\t------------------");
 			
 		    // Always close files.
 			
 		    bufferedReader.close();
 	}

 }