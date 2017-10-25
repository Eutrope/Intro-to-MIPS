# Intro-to-MIPS
A compilation of MIPS programs for my computer systems course.<br>

<b>1. Least common multiple</b><br>
Write a MIPS procedure lcm that accepts two integers as arguments and returns their least
common multiple. That is, given a and b, the procedure should find the smallest integer
which is a multiple of both numbers. For example the least common multiple of 4 and 6 is
12. You can use the div instruction with suitable supporting instructions for this problem.<br>
Write a main procedure which calls test your function with two hard-coded arguments,
and then prints out the result.<br>

<b>2. String capitalization</b><br>
You are now required to write a MIPS program that reads a string from standard input,
and then prints the same string but with each word capitalized. You can assume that the
string input by the user is comprised of words consisting of sequential keyboard characters,
with each word separated by a single "space" character and with each word beginning
with an alphabetical character. The program should be able to handle strings up to 127
characters in length. No characters other than lowercase letters should be modified. Use
properties of the ASCII code to solve this problem.<br>
Implement the conversion operation in a subroutine named upper, which accepts the
address of the input string as it's only argument.<br>
Create a main procedure which prompts for input from standard input, calls your
procedure, and then prints the output.<br>
As a working example, given the input string <b>"the c12a:t in Th*2 hat"</b> the printed
output should read <b>"The C12a:t In Th*2 Hat"</b>.<br>

<b>3. Dijkstra's GCD Algorithm</b><br>
Dijkstra created an algorithm for finding the greatest common divisor (GCD) of a number
based on the principle that if a number c divides a and b, then it divides a - b.<br>
Create a subroutine, "gcd", that implements this algorithm. Note that this must be a
recursive subroutine.<br>
Also create a short "main" procedure to test the subroutine. The "main" procedure
should prompt the user for two integers (to be typed in using standard input) and should
print out the GCD of these numbers.
