input = input.txt
output = output.txt
TARGET = parser
INPUT = input.txt

main: lexer.l parser.y symtab.c codeGen.c
	bison -d parser.y
	flex lexer.l
	gcc parser.tab.c lex.yy.c symtab.c codeGen.c -o parser
	./parser < $(input)

clean:
	rm -f parser parser.tab.* lex.yy.c

run: main
	./$(TARGET) < $(INPUT)