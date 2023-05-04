// Agent sample_agent in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */



!match_location(Loc).

+location(Loc) : matching_hotels 
<- .print("match location started as Loc : ",Loc);
?rooms(R);
!match_location(Loc,R).

+location(Loc) : true 
<- .print("match location started as Loc : ",Loc);
?rooms(R);
!match_location(Loc,R).
//.print(List).


+!match_location(_,[]) : true <- .print("No hotel left").

+!match_location(Loc,[H|T]) : H=[_,Loc|_]
<- .print(H);
!match_location(Loc,T).


+!match_location(Loc,[H|T]) : true 
<- .print("No location match");
!match_location(Loc,T).

+!match_location(Loc,[_|T]) : true
<- !match_location(Loc,T).



{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
