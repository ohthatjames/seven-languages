/* Make a simple knowledge base. Represent some of your favorite books and authors. */

book('Interesting Times', 'Terry Pratchett').
book('Anna Karenin', 'Leo Tolstoy').
book('Solar', 'Ian McEwan').
book('Wyrd Sisters', 'Terry Pratchett').

/* Find all books in your knowledge base written by one author. */

/* ?- book(Title, 'Terry Pratchett').

Title = 'Interesting Times' ? ;

Title = 'Wyrd Sisters' ? ;

(1 ms) yes */

/* Make a knowledge base representing musicians and instruments. Also represent musicians and their genre of music.*/

musician_instrument('Vogg', guitar).
musician_instrument('Jeff Healey', guitar).
musician_instrument('Thom Yorke', vocals).
musician_instrument('Vitek', drums).

musician_genre('Vogg', 'death metal').
musician_genre('Jeff Healey', 'blues').
musician_genre('Thom Yorke', 'indie').
musician_genre('Vitek', 'death metal').

/* Find all musicians who play the guitar. */

/*
| ?- musician_instrument(What, guitar).

What = 'Vogg' ? ;

What = 'Jeff Healey' ? ;

no
*/
