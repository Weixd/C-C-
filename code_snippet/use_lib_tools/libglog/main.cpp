#include <glog/logging.h>
#include <string>
#include <sys/stat.h>
using namespace std;

int main(int argc, char *argv[])
{
    // HOME_PATH
    string home = "./log/";  //要先创建此目录,否则运行报错.
    int ret = mkdir(home.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    if(ret != 0)
        return -1;

    //glog init
    google::InitGoogleLogging(argv[0]);

    string info_log = home + "master_info_";
    google::SetLogDestination(google::INFO, info_log.c_str());

    string warning_log = home + "master_warning_";
    google::SetLogDestination(google::WARNING, warning_log.c_str());

    string error_log = home + "master_error_";
    google::SetLogDestination(google::ERROR, error_log.c_str());

    string fatal_log = home + "master_fatal_";
    google::SetLogDestination(google::FATAL, fatal_log.c_str());

    LOG(INFO) << "INFO Glog";
    LOG(WARNING) << "WARNING Glog";
    LOG(ERROR) << "ERROR Glog";
    LOG(FATAL) << "FATAL Glog";
    return 0;
}
