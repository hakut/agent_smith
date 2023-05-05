// Agent mediator_agent in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */

+check_location(L) : true 
<- .send(hotel1, tell, location(L));
	.send(hotel2,tell,location(L));
.print("Message sent to hotel agent").
						
							
+available_hotels(L) : true 
<- .send(client, tell, check_price_and_star(L));
.print("List is sent to client").

+matching_price_star(H): true
<- .send(hotel1,tell,reserve_hotel(H)).
							
+reserve_successful: true
<- .send(client,tell,reserve_successful).
//+available_hotels()

+no_available_hotel : true
<- .send(client,tell,no_available_hotel).
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
