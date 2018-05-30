#include "Util.h"
#include <fstream>
#include <iostream>
#include <wordexp.h>

using namespace std;

vector<string> getColours(const string &wallPath)
{
	system((string{"wal -i \'"} + resolvePath(wallPath) + "\' -s -t &>/dev/null").c_str());
	
	ifstream coloursFile{ resolvePath("~/.cache/wal/colors") };
	
	vector<string> colours{};

	string line;
	const size_t maxElements = 4;

	for (size_t i = 0; i < maxElements && getline(coloursFile, line); i++)
		colours.push_back(line);

	return colours;
}

string resolvePath(const string &path)
{
	wordexp_t expStrArray;

	if (wordexp(path.c_str(), &expStrArray, 0) != 0)
		throw runtime_error{ "Failed to interpret path correctly" };

	string rPath{};

	for (size_t i = 0; i < expStrArray.we_wordc; i++)
		rPath += expStrArray.we_wordv[i];

	wordfree(&expStrArray);

	return rPath;
}
