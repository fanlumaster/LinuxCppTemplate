#include <iostream>
#include <cctype>
#include <string>

using namespace std;

// 不区分大小写，无论是大写还是小写，只要是 26 个英文字母，就都可以
bool checkAlpha(const std::string &s) { return s.size() == 1 && isalpha(s[0]); }

int main(int argc, char *argv[]) {
  cout << checkAlpha("a") << "\n";
  cout << checkAlpha("A") << "\n";
  return 0;
}
