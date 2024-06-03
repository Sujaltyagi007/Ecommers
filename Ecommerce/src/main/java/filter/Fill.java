package filter;

public class Fill {
	
	public static String fil (String f) {
		String query="";
		if(f.equals("l2000")) {
			query="select * from product where pprice<2000";
		}
		else if(f.equals("all")) {
			query="select * from product";
		}
		else if(f.equals("l3000")) {
			query="select * from product where pprice>2000";
		}
		return query;
		
		

	}
}
