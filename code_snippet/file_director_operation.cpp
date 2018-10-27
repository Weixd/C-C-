//  获取当前路径
#include <string>

std::string func_get_current_folder(void)
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


// 路径存在判断
bool func_path_exist(std::string path)
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



// 目录遍历（递归）
enum {
	OPEN_SECCEED = 0;
	OPEN_FAILED;
};

int scan_dir(char *dir, int depth)
{
	DIR *child_dp;
	struct dirent *entry;         // define the dirent struct pointer to save the child directories.
	struct stat statbuf;          // define the statbuf struct for save the files proprety.

	if((child_dp = opendir(dir)) == NULL) {
		puts("can't open dir.");
        return 1;
	}
	
	chdir(dir);// switch to the opened director

	while((entry = readdir(child_dp)) != NULL) // get child director information，if readdir result is NULL to end the loop.
	{
		lstat(entry->d_name, &statbuf); // get child member property.

		if(S_IFDIR &statbuf.st_mode) {  // judge the child director is a director?
			if (strcmp(".", entry->d_name) == 0 || strcmp("..", entry->d_name) == 0)
				continue;

			printf("%*s%s/\n", depth, "", entry->d_name);  // print the director name.
			scan_dir(entry->d_name, depth+4);              // recursion self and scan the child director member
		} else {
			printf("%*s%s\n", depth, "", entry->d_name);  // output members that proprety is not director.
		}
	}

	chdir("..");// go to parent director
	closedir(child_dp);// close the stream of child director.
	return 0;
}
