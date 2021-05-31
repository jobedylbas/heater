compile: y.tab.c lex.yy.c
	gcc lex.yy.c y.tab.c -o aquecedor 
	chmod +x aquecedor

lex.yy.c: heater.l
	lex heater.l

y.tab.c: parser.y
	yacc parser.y -d

clean:
	rm -rf lex.yy.c aquecedor aquecedor.tgz y.tab.c y.tab.h 

compress: clean
	tar cvzf aquecedor.tgz Makefile heater.l parser.y README.md