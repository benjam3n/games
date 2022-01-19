import net.http
import rand
import os
import term

fn get_word(){
	mut i := 0
	mut t := 0
	mut user := User{}
	user.bad_guess = 8
	f := http.get_text('https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt').split_into_lines()
	user.cur_word=f[rand.i64n(10000)]
	println(user.cur_word)
	user.cur_guess = '_'.repeat(user.cur_word.len)
	println('Your word has ${user.cur_word.len} letters')
	
	for user.bad_guess > 1 && user.cur_guess != user.cur_word{
		println('Guess a letter')
		user.cur_letter = os.get_line() + '$'
		if user.cur_letter[0].is_letter(){

			for i<user.cur_word.len{
				if user.cur_word[i]==user.cur_letter[0]{
					user.cur_guess+=user.cur_letter.substr(0,1)+user.cur_guess[i..]
					user.bad_guess++
					t++	
				}
				i++
			}
			user.bad_guess--
			i=0
			if t>0{
				println('You found a match.')
			} if t<1{
				println('No match was found')
			}
			println('You have ${user.bad_guess} guesses remaining')
				
		} 
		if !user.cur_letter[0].is_letter() {
			println('Invalid Input')
		}
		
	}
	if user.cur_word==user.cur_guess {
		println('You guessed it')
		println('Your word was ${user.cur_word}')
	}
	if user.cur_word!=user.cur_guess {
		println('That guess was wrong.')
	}
	get_word()
}

struct User {
mut:
	max_score	int
	cur_word	string
	cur_guess	string
	cur_letter	string
	bad_guess	int
}
fn main(){
	println('Welcome to the Hangman game. You have 8 tries to guess the random word')
	get_word()
}
