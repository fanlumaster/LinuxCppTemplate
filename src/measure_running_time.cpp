#include <iostream>
#include <string>
#include <vector>
#include <chrono>

void test() {
  std::vector<std::string> vec_str;
  for (int i = 0; i < 500; i++) {
    vec_str.push_back("hello");
  }
}

int main(int argc, char *argv[]) {
  auto start = std::chrono::high_resolution_clock::now();
  test();
  auto end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double, std::milli> duration_ms = end - start;
  std::cout << "running time: " << duration_ms.count() << std::endl;
  return 0;
}
