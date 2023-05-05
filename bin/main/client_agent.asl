// Agent client in project hotel_reservation_system

/* Initial beliefs and rules */

/* Initial goals */

matching_price([]).
best_match([]).
!check_availability.


+!check_availability : location(L) 
<- .send(mediator, tell, check_location(L));
.print("Message sent to mediator").

+check_price_and_star(L) : true
<- ?star(S_min);
?price(P_max);
!check_list(L,S_min,P_max);
?matching_price(X);
!find_best(X,P_max);
?best_match(A);
.print(A);
.send(mediator,tell,matching_price_star(A));
.print("checking").


+!check_list([],_,_) : true 
<-.print("No hotel left").

+!check_list([H|T],S_min,P_max) : H=[_,_,S,P] & S >= S_min & P <= P_max
<- .print(H);
?matching_price(R);
!add_list(H,R);
!check_list(T,S_min,P_max).

+!check_list([H|T],S_min,P_max)
<- //.print("No location match");
!check_list(T,S_min,P_max).

+!add_list(H,R) : true
<- -matching_price;
+matching_price([H|R]);
//.print("add list",H,R);
.print("add list").


+!find_best([H|T],P_max) : H = [_,_,S,P] & P < P_max
<- -best_match;
+best_match([H]);
!find_best(T,P).

+!find_best([H|T],P_max)
<- !find_best(T,P_max).

+!find_best([],_) : true
<- ?best_match(X);.print(X);.print("End of line").

+reserve_successful: true
<- .print("Successfully reserved");
.my_name(MyName);
.print(MyName);
.kill_agent(MyName).

+no_available_hotel:true
<- .print("Anyway").
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }
{ include("$moiseJar/asl/org-obedient.asl") }
