gcc -L/usr/local/lib -L/opt/local/lib -I/usr/include -I/usr/include/js -I/usr/include/mozjs -I/usr/local/include -I/opt/local/include -I/usr/local/include/js -I/opt/local/include/js -DXP_UNIX -lmozjs -L/usr/local/lib -L/opt/local/lib -lpthread -lm jshelper.c -o jshelper

