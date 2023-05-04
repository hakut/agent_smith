// CArtAgO artifact code for project hotel_reservation_system

package tools;

import cartago.*;

public class HotelOps extends Artifact {
	void init() {
//		defineObsProperty("count", initialValue);
	}

	@OPERATION
	void check_available(String loc, int star, float price) {
		
	}
	@OPERATION
	void inc() {
		ObsProperty prop = getObsProperty("count");
		prop.updateValue(prop.intValue()+1);
		signal("tick");
	}
}

