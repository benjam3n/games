import net.http
import rand
import os
import term
import time
fn get_word(){
  	mut i := 0
	mut t := 0
 	mut q := 0
	mut user := User{}
	user.bad_guess = 8
	f := http.get_text('https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt').split_into_lines()
	user.cur_word=f[rand.i64n(10000)]
  	user.cur_guess= []string{len:user.cur_word.len,init:'_'}
	println('Your word has ${user.cur_word.len} letters')
	for user.bad_guess > 0 && t!=user.cur_word.len{
		println('Guess a letter')
		user.cur_letter = os.get_line() + '$'
		term.clear_previous_line()
		if user.cur_letter[0].is_letter(){
			for i<user.cur_word.len{
				if user.cur_word[i]==user.cur_letter[0]{
          				user.cur_guess[i]=user.cur_word[i..i+1]
					t++	
          				q++
				}
				i++
			}
			user.bad_guess--
			i=0
			if q>0{
				println('You found a match.')
				
				
			} if q<1{
				println('No match was found.')
			}
      			q=0
			println('You have ${user.bad_guess} guesses remaining.')
			time.sleep(3000000000)
			term.clear_previous_line()
			term.clear_previous_line()
			term.clear_previous_line()
			term.clear_previous_line()
      			mut ry:=0
      			for ry<user.cur_guess.len{
        			print(user.cur_guess[ry])
        			ry++
      			}
      			println('')
      			ry=0	
		} 
		if !user.cur_letter[0].is_letter() {
			term.clear_previous_line()
			term.clear_previous_line()
			term.clear_previous_line()
			println('Invalid Input. Only enter a letter')
		}
	}
	term.clear_previous_line()
	if t==user.cur_word.len {
		
		println('You guessed it')
		println('Your word was ${user.cur_word}')
	}
	if t<user.cur_word.len {
		println('That guess was wrong.')
    		println('Your word was ${user.cur_word}')
	}
	get_word()
}

struct User {
mut:
	cur_word	string
	cur_guess	[]string
	cur_letter	string
	bad_guess	int
}

fn main(){
	println('Welcome to the Hangman game. \nYou have 8 tries to guess the random word.')
	time.sleep(3000000000)
	term.clear()
	get_word()
}

