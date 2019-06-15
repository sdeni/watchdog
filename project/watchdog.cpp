#include "gtest/gtest.h"

#include <boost/filesystem.hpp>
#include <boost/process.hpp>

namespace fs = boost::filesystem;
namespace bp = boost::process;

fs::path exe_dir;

TEST(the, test) {
    std::vector<fs::path> paths{ exe_dir };
    fs::path client_path = bp::search_path("client", paths);

    bp::ipstream in;
    bp::opstream out;

    bp::child client{ client_path, bp::std_in < out, bp::std_out > in };

    std::string str;
    std::getline(in, str);
    std::cout <<"Watchdog: client said: " << str << std::endl;
    out << "Hi from WD!" << std::endl;

    client.wait();
}

int main(int argc, char **argv) {
  printf("Running main() from %s\n", __FILE__);
  exe_dir = fs::system_complete(argv[0]).parent_path();
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
