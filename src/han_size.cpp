#include <iostream>
#include <string>

std::string::size_type get_first_char_size(std::string words) {
  size_t cplen = 1;
  // https://en.wikipedia.org/wiki/UTF-8#Description
  if ((words[0] & 0xf8) == 0xf0)
    cplen = 4;
  else if ((words[0] & 0xf0) == 0xe0)
    cplen = 3;
  else if ((words[0] & 0xe0) == 0xc0)
    cplen = 2;
  if (cplen > words.length())
    cplen = 1;
  return cplen;
}

int main(int argc, char *argv[]) {
  std::string s = "你好";
  s = "燮郑"; // 3
  s = "𰻝𰻝面";   // 4
  std::cout << get_first_char_size(s) << "\n";
  return 0;
}
