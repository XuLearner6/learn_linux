#include <stdio.h>
#include <stdarg.h>

void format_string(char *buffer, size_t buffer_size, 
                    const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vsnprintf(buffer, buffer_size, format, args);
    va_end(args);
}


int main()
{
    char buffer[100];

    format_string(buffer, sizeof(buffer), "Hello, %s! You hace %d new messages.", "xuhaozhong", 5);

    printf("%s\n", buffer);

    return 0;
}