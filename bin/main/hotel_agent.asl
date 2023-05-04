// Agent sample_agent in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */

matching_hotels([]).

!match_location(Loc).

+location(Loc) : matching_hotels 
<- .print("match location started as Loc : ",Loc);
?rooms(R);
!match_location(Loc,R).
//?matching_hotels(R);
//.print(R).
+location(Loc) : true 
<- .print("match location started as Loc : ",Loc);
?rooms(R);
!match_location(Loc,R).


+!match_location(_,[]) : true <- .print("No hotel left").

+!match_location(Loc,[H|T]) : H=[_,Loc|_]
<- .print(H);
!add_list(H);
!match_location(Loc,T).


+!match_location(Loc,[H|T]) : true 
<- .print("No location match");
!match_location(Loc,T).

+!match_location(Loc,[_|T]) : true
<- !match_location(Loc,T).

+!add_list(H) : matching_hotels(R)
<-newList([]); 
.concat(R,[H],newList);
-matching_hotels(R);
+matching_hotels(newList);
.print("Updated list is ", newList).

+!add_list(H) : matching_hotels([])
<- matching_hotels(H);
.print("Updated list is ", H).


{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
