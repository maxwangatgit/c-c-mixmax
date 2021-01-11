CC=gcc
CXX=g++
LINK=g++
CXXFLAGS=-fPIC
CFLAGS=-fPIC
LDFLAGS=-lstdc++ -lm
# -share 生成动态链接库
# -fPIC 64位系统使用,除了链接过程需要，每次编译过程都需要
SOFLAGS=-shared -fPIC

SRCC=$(wildcard *.c)
OBJS+=$(patsubst %.c,%.o,$(SRCC))
SRCCPP=$(wildcard *.cpp)
OBJS+=$(patsubst %.cpp,%.o,$(SRCCPP))



TARGET=libmixmake.so
# link
$(TARGET):$(OBJS)
	$(LINK)    -o $@  $(OBJS)  $(SOFLAGS) $(LDFLAGS)


# compile
%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $< 
%.o:%.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $< 




.PHONY:clean
clean:
	rm $(OBJS)
	rm $(TARGET)