EXE := server

# wildcard扫描源文件
sources := ${wildcard *.cpp}
headfile := ${wildcard *.h}
objects := ${sources:.cpp=.o}

CC := g++ -std=c++11
RM := rm -rf
Lib :=

${EXE}: ${objects}
	${CC} -o $@ $^ ${Lib}

${objects}: %.o: %.cpp ${headfile}
	${CC} -o $@ -c $<

# 伪目标，意味着clean不代表一个真正的文件名
.PHONY: clean cleanall
cleanall:
	${RM} ${EXE} ${objects}
clean:
	${RM} ${objects}