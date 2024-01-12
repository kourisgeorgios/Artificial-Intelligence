/*1-Κοινό θέμα (κάποιες λέξεις σχετικά με το genre κοινές) -> 2 OR 3 */
same_genre(X, Y, G1) :- genre(X, G1), genre(Y, G1), X \= Y.

/*2-Αρκετά κοινό θέμα (κάποιες λιγότερες λέξεις σχετικά με το genre κοινές π.χ. 3)*/
same_genre_3(X, Y) :- same_genre(X, Y, G1), same_genre(X, Y, G2), same_genre(X, Y, G3), G1 \= G2, G1 \= G3, G2 \= G3.

/*3-Σχετικά κοινό θέμα (λίγες λέξεις σχετικές με το genre κοινές π.χ. 1)*/
same_genre_1(X, Y) :- same_genre(X, Y, G1).

/*4-Κοινός σκηνοθέτης*/
same_director(X, Y) :- director_name(X, S), director_name(Y, S), X \= Y.

/*PLOT*/
same_word(X, Y, W) :- plot_keyword(X, W), plot_keyword(Y, W), X \= Y.
/*5-Ακριβώς ίδια πλοκή (κάποιες λέξεις κλειδιά της πλοκής κοινές)*/
same_plot_3(X, Y) :- same_word(X, Y, P1), same_word(X, Y, P2), same_word(X, Y, P3), P1 \= P2, P1 \= P3, P2 \= P3.

/*6-Σχετικά ίδια πλοκή (κάποιες λιγότερες λέξεις κλειδιά κοινές)*/
same_plot_2(X, Y) :- same_word(X, Y, P1), same_word(X, Y, P2), P1 \= P2.

/*7-Ίδιους τους βασικούς ηθοποιούς (και τους 3)*/
same_actor(X, Y, Q) :- actor_name(X, Q), actor_name(Y, Q), X \= Y.

same_actor_3(X, Y) :- same_actor(X, Y, Q1), same_actor(X, Y, Q2), same_actor(X, Y, Q3), Q1 \= Q2, Q1 \= Q3, Q2 \= Q3.

/*8-Αρκετά ίδιους βασικούς ηθοποιούς (ορισμένους βασικούς ηθοποιούς κοινούς π.χ. 2)*/
same_actor_2(X, Y) :- same_actor(X, Y, Q1), same_actor(X, Y, Q2), Q1 \= Q2.

/*9-Σχετικά ίδιους ηθοποιούς (π.χ. 1 από τους 3)*/
same_actor_1(X, Y) :- same_actor(X, Y, Q1).

/*10-Ίδια γλώσσα*/
same_language(X, Y) :- language(X, L), language(Y, L), X \= Y.

/*11-Είναι έγχρωμες ή ασπρόμαυρες*/
black_and_white(X) :- plot_keyword(X, "black and white").

/*12-Κοινό studio παραγωγής*/
same_production_company(X, Y):- production_company(X, P), production_company(Y, P), X \= Y.

/*13-Κοινή χώρα παραγωγής */
same_country(X, Y) :- country(X, C), country(Y, C), X \= Y.

/*14-Ίδια δεκαετία */
same_decade(X, Y) :- decade(X, T), decade(Y, T), X \= Y.

/*find_sim*/
find_sim_1(X, Y) :- same_genre_1(X, Y).
find_sim_2(X, Y) :- same_genre_3(X, Y).

find_sim_3(X, Y) :- find_sim_2(X, Y), same_plot_2(X, Y).
find_sim_4(X, Y) :- find_sim_2(X, Y), same_plot_3(X, Y).

find_sim_5(X, Y) :- find_sim_3(X, Y), same_country(X, Y), same_language(X, Y).
find_sim_6(X, Y) :- find_sim_5(X, Y), same_production_company(X, Y), same_decade(X, Y).

