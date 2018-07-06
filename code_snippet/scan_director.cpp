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
}
