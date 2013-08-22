#include <iostream>
#include <windows.h>

#define GLOG_NO_ABBREVIATED_SEVERITIES

#include <iostream>
#include "glog/logging.h"
#include "glog/log_severity.h"

int main(int argc, char **argv) 
{
	std::cout << "start" << std::endl;

    std::cout << argv[0] << std::endl;
    //std::cout << argv[1] << std::endl;

    google::GetLoggingDirectories();
    google::InitGoogleLogging("");

    //google::SetLogDestination(google::GLOG_INFO, "");
    google::SetLogDestination(google::GLOG_ERROR, "");
    //google::SetLogDestination(google::GLOG_WARNING,"");
    //其他配置
    //google::SetStderrLogging(google::GLOG_INFO);//配置输出到标准错误输出的最低日记级别
    //google::LogToStderr();//只输出到标准错误输出

    

  LOG(ERROR) << "ERROR This should work";
  LOG_IF(ERROR, 3 > 2) << "ERROR This should be also OK";

  LOG(INFO) << "INFO This should work";
  LOG_IF(INFO, 3 > 2) << "INFO This should be also OK";

  LOG(WARNING) << "WARNING This should work";
  LOG_IF(WARNING, 3 > 2) << "WARNING This should be also OK";

  int i;
  std::cin >> i;
  return 0;
}