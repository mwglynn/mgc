OBJS = ast.cmo parser.cmo scanner.cmo sast.cmo semant.cmo mgc.cmo

mgc : $(OBJS)
	ocamlc -o mgc $(OBJS)

scanner.ml : scanner.mll
	ocamllex scanner.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

.PHONY : clean
clean :
	rm -f mgc parser.ml parser.mli scanner.ml *.cmo *.cmi

# Generated by ocamldep *.ml *.mli
mgc.cmo: scanner.cmo parser.cmi ast.cmi 
mgc.cmx: scanner.cmx parser.cmx ast.cmi 
parser.cmo: ast.cmi parser.cmi 
parser.cmx: ast.cmi parser.cmi 
scanner.cmo: parser.cmi 
scanner.cmx: parser.cmx 
parser.cmi: ast.cmi 
semant.cmo: semant.ml
sast.cmo: sast.ml