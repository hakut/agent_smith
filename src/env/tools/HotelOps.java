// CArtAgO artifact code for project hotel_reservation_system

package tools;

import cartago.*;
import java.util.*;

public class HotelOps extends Artifact {
	private Dictionary<String,HashMap<Integer,Integer>> matches = new Hashtable<>();
//	private ObsProperty myProp;
	void init() {
//		linkToAgent("mediator_agent",receiverId);
	}

	@OPERATION
	void add_list(String Name, String Location, int star, int price) {
		matches.put(Name, new HashMap<>());
		matches.get(Name).put(star, price);
	}
	@OPERATION
	void print_list() {
		System.out.println(matches);
	}
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

