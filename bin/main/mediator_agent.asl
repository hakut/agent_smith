// Agent mediator_agent in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */

+check_location(L) : true <- .send(hotel1, tell, location(L));
//							.send(hotel2,tell,check_location(L));
							.print("Message sent to hotel agent").
							
//+available_hotels()

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
