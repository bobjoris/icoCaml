TARGET = pseudopascal

all: pseudopascal clean

pseudopascal: lexer.cmo pseudopascal.cmo middleEnd.cmo main.cmo
	ocamlc -o $@ lexer.cmo pseudopascal.cmo middleEnd.cmo main.cmo

clean:
	rm -rf pseudopascal.ml pseudopascal.mli lexer.ml lexer.cmi lexer.cmo main.cmi main.cmo pseudopascal.cmi pseudopascal.cmo syntax.cmi middleEnd.cmo middleEnd.cmi

depend:
	ocamldep *.ml *.mli > .depend

.SUFFIXES: .ml .mli .mll .mly .cmo .cmi

.ml.cmo:
	ocamlc -c $<
.mli.cmi:
	ocamlc -c $<
.mll.ml:
	ocamllex $<
.mly.ml:
	ocamlyacc $<
.mly.mli:
	ocamlyacc $<

include .depend