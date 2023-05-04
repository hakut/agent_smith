// Agent client in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */
!check_availability.


+!check_availability : location(L) 
<- .send(mediator, tell, check_location(L));
.print("Message sent to mediator").

   

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
