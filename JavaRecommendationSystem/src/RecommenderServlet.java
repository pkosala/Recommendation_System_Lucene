

import org.apache.lucene.queryparser.classic.ParseException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 * Servlet implementation class RecommenderServlet
 */
@WebServlet("/RecommenderServlet")
public class RecommenderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommenderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
   
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        String initial = config.getInitParameter("initial");
        try {
        	crawlingJsoup.crawl("",getServletContext().getRealPath("/"));
        }
        catch (Exception e) {
        }
      }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id=request.getParameter("id");
		if(id==null)
			id="0";
		try {

			String output[]=SimpleLuceneIndexing.mainCall(Integer.parseInt(id),getServletContext().getRealPath("/"));

			BufferedReader br = null;
			String path=null;
			if(System.getProperty("os.name").toLowerCase().startsWith("windows"))
			{
				path=getServletContext().getRealPath("/")+"linkfiles\\";
			}
			else
			{
				path=getServletContext().getRealPath("/")+"linkfiles/";
			}
			JSONArray jArray = new JSONArray();
			for(int i=0;i<output.length;i++)
			{
				String temppath;
				temppath=path+output[i];
				br = new BufferedReader(new FileReader(temppath));
				String sCurrentLine,finalOutput="";
				sCurrentLine = br.readLine();
				finalOutput += sCurrentLine;
				br.close();
				String messageString="message"+i;

				JSONObject jObj = new JSONObject();
				jObj.put(messageString, "https://en.wikibooks.org"+finalOutput);

				jArray.put(jObj);
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jArray.toString());

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}

	}

}
