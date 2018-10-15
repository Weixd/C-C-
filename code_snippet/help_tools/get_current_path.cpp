#include <string>

std::string get_current_folder()
{
#ifdef __linux
    char path[1024]={0};
    int cnt = readlink("/proc/self/exe", path, 1024);
    if(cnt < 0 || cnt >= 1024)
        return "";
    for(int i = cnt; i >= 0; --i)
    {
        if(path[i]=='/')
        {
            path[i + 1]='\0';
            break;
        }
    }
    return path;
#else
    CHAR path[MAX_PATH];
    ::GetModuleFileNameA(NULL, path, MAX_PATH);
    int cnt = strlen(path);
    for (int i = cnt; i >= 0; --i)
    {
        if (path[i] == '\\')
        {
            path[i + 1] = '\0';
            break;
        }
    }
    return path;
#endif
}

