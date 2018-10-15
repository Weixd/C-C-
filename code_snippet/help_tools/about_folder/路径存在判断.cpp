
bool pathexist(std::string path)
{
#ifdef __linux
    struct stat buf;
    if(-1 == stat(path.c_str(),&buf))
        return false;
    return true;
#else
    return ::PathFileExistsA(path.c_str())==TRUE;
#endif
}

