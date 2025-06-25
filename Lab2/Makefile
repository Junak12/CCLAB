# Executable name
EXEC = cal1

# Input/output file pairs
INPUTS = input0.txt input1.txt input2.txt input3.txt input4.txt

# Default rule: build and run
all: build run

# Build the lexer
build:
	flex cal1.l
	gcc lex.yy.c -o $(EXEC)

# Run the lexer on all input files
run:
	@for i in 0 1 2 3 4 ; do \
		echo "Running on input$$i.txt..."; \
		./$(EXEC) < input$$i.txt > output$$i.txt; \
	done
	@echo "✅ All files processed."

# Clean everything
clean:
	rm -f lex.yy.c $(EXEC) output*.txt
