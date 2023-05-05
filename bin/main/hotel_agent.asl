// Agent sample_agent in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */

matching_hotels([]).
rest([]).
!match_location(Loc).



+location(Loc) : true 
<- .print("match location started as Loc : ",Loc);
?rooms(R);
!match_location(Loc,R);
?matching_hotels(X);
.print("matching hotel list is : ",X);
.send(mediator,tell,available_hotels(X));
.print("end of location belief").

//+location(Loc) : true 
//<- .print("match location started as Loc : ",Loc);
//?rooms(R);
//!match_location(Loc,R);
//.print("No matching hotels");
//.send(mediator,tell,no_available_hotel);
//.print("end of location belief").

+!match_location(_,[]) : true 
<-.print("No hotel left").

+!match_location(Loc,[H|T]) : H=[N,Loc,S,P]
<- .print(H);
?matching_hotels(R);
!add_list(H,R);
!match_location(Loc,T).


+!match_location(Loc,[H|T])
<- .print("No location match");
!match_location(Loc,T).


+!add_list(H,R) : true
<- -matching_hotels;
+matching_hotels([H|R]);
//.print("add list",H,R);
.print("add list").

+reserve_hotel(X): true
<- ?rooms(R);
.print("X is",X);
!remove_match(X,R);
X = [[N|_]];
.print("Hotel ",N," is reserved");
.send(mediator,tell,reserve_successful).

+!remove_match([X],[H|T]): H = [N,L,S,P] & X = [N,L,S,P]
<-.print(X);
-rooms;
+rooms(T).

+!remove_match(X,[H|T])
<- .concat(T,[H],N);
!remove_match(X,N).




{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
