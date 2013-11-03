import java.io.*;
import java.net.*;
import java.io.*;

public class TCPListnerV2
{
	public static void main(String args[]) throws Exception
	{

		private static final String[] minecraftProcGrep = new String[]{"bash", "-c", "screen -ls | grep minecraft"};
		private static final String[] minecraftProcStart = new String[]{"bash", "-c", "/home/justin/Games/startMinecraft.sh"};
		 
		while(true)
		{
			String clientSentence;
			String capitalSentence;
			ServerSocket welcomeSocket = new ServerSocket(25565);
		
			while(true)
			{
				Socket connectionSocket = welcomeSocket.accept();
				BufferedReader inFromClient = new BufferedReader(new InputStreamReader(connectionSocket.getInputStream()));
				String input;
				if(null != inFromClient.readLine())
				{
					break;
				}
			}

			try
			{
				PrintWriter printWriter = new PrintWriter(new File("error.log"), true);
				
				Runtime runtime = Runtime.getRuntime();
				Process process = runtime.exec(minecraftProcGrep);

				BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));

				String result = stdInput.readLine();
				stdInput.close();
				if(result != null && result.length() > 0)
				{
					printWriter.println("Port was called, minecraft is already up and running");
				}
				else
				{
					printWriter.println("Port was called, starting minecraft now");
					process.waitFor();
					runtime.exec(minecraftProcStart);
					
					//Check the process again
					process = runtime.exec(minecraftProcGrep);

					stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));

					result = stdInput.readLine();
					stdInput.close();
					if(result != null || result.length() == 0)
					{
						printWriter.close();
						continue;
					}
				}

				printWriter.close();
				break;
			}
			catch(IOException er)
			{
				//And eat
			}
		}
	}
}
