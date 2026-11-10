import sys
from antlr4 import FileStream, CommonTokenStream
from antlr4.error.ErrorListener import ErrorListener
from PythonGrammarLexer import PythonGrammarLexer
from PythonGrammarParser import PythonGrammarParser


class StrictErrorListener(ErrorListener):
    """Stop on the first lexer/parser error instead of just printing it."""

    def syntaxError(self, recognizer, offending_symbol, line, column, msg, e):
        raise SystemExit(f"Syntax error at line {line}, column {column}: {msg}")


def main():
    ##Defaults to "project_deliverable_1.py" for testing if no arguments are specified 
    path = sys.argv[1] if len(sys.argv) > 1 else "project_deliverable_1.py"

    lexer = PythonGrammarLexer(FileStream(path, encoding="utf-8"))
    lexer.removeErrorListeners()
    lexer.addErrorListener(StrictErrorListener())

    parser = PythonGrammarParser(CommonTokenStream(lexer))
    parser.removeErrorListeners()
    parser.addErrorListener(StrictErrorListener())

    tree = parser.program()  # 'program' is the start rule from PythonGrammar.g4
    print(tree.toStringTree(recog=parser))


if __name__ == "__main__":
    main()