### Deliverable 1 (11/13): 
# Arithmetic Operators: +, -, *, /, %,
# Assignment Operators: =, +=, -=, *=, /=

### Deliverable 2 (11/20): 
# if/elif/else blocks
# Conditional Statements: <, <=, >, >=, ==, !=, and, or, not

### Deliverable 3 (12/11): 
# while/for Loops
# Nested Structures
# Support for Comments

### Documentation (12/11)
# Report
# README.md 
# Demo Video

############################# Grammar Start #############################
grammar PythonGrammar;
program
: 'hello' ID EOF
;
ID
: [a-zA-Z]+
;
WS
: [ \t\r\n]+ -> skip
;


/////////////////////////////////////////////
///////         LEXER RULES           ///////
/////////////////////////////////////////////

