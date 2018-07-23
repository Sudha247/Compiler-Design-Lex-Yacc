#include <iostream>
#include <fstream>
#include <string>

using namespace std;
struct table
{
	string id,type,val;
} t[15];
int tp;

string types[4] = {"int","float","char","double"}; // 4


int main(){
	ifstream fin("symboltable.txt");
	string word;
	int i;
	
	while(!fin.eof()){
		fin >> word;
		for(i = 0; i < 4; i++){
			if(word == types[i]){
				t[tp].type = word;
				fin >> word;
				t[tp].id = word;
				fin >> word;
				fin >> word;
				t[tp].val = word;
				tp++;
			}
		}
	}

	cout <<"SYMBOL TABLE\n";
	cout <<"Identifier\tType\tValue\n";
	for (i = 0; i < tp; ++i)
	{
		/* code */
		cout << t[i].id << "\t" << t[i].type << "\t" << t[i].val << "\n";
	}


}