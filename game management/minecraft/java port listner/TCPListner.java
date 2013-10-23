import java.io.*;
import java.net.*;
import java.io.*;

public class TCPListner
{
	public static void main(String args[]) throws Exception
	{
		String clientSentence;
		String capitalSentence;
		ServerSocket welcomeSocket = new ServerSocket(25566);

		while(true)
		{
			Socket connectionSocket = welcomeSocket.accept();
			BufferedReader inFromClient = new BufferedReader(new InputStreamReader(connectionSocket.getInputStream()));
			String input;
			if(null != inFromClient.readLine())
			{
				try
				{
					//System.out.println("Port was called, starting minecraft now");
					PrintWriter printWriter = new PrintWriter(new File("error.log"));
					
					Runtime runtime = Runtime.getRuntime();
					Process process = runtime.exec(new String[]{"bash", "-c", "screen -ls | grep minecraft"}); 

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
						process = runtime.exec(new String[]{"bash", "-c", "/home/justin/Games/startMinecraft.sh"});
					}

					printWriter.close();
				}
				catch(IOException er)
				{
					//And eat
				}
			}
		}
	}
}
