CXX=gcc
FILES=01a 01b 02a 02b 03a 03b 04a 04b 05a 05b
FLAGS=-g


04a: 04a.c
	$(CXX) $(FLAGS) 04a.c -o 04a -lcrypto

04b: 04b.c
	$(CXX) $(FLAGS) 04b.c -o 04b -lcrypto

%: %.c
	$(CXX) $(FLAGS) $< -o $@

all: $(FILES)

clean:
	$(RM) $(FILES) dummy.txt
