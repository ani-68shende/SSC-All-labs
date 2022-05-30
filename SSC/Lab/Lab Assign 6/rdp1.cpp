#include <bits/stdc++.h>

using namespace std;

string s;
char tk;
int pt = 0;

/*
E -> TE'
E' -> +TE | epsilon
T -> FT'
T' -> *FT | epsilon
F -> (E) | id
*/

void E();
void ED();
void T();
void TD();
void F();

void advance()
{
	pt++;
	tk = s[pt];
}

void E()
{
	T();
	ED();
}

void ED()
{
	if (tk == '+')
	{
		advance();
		T();
		E();
	}
}

void T()
{
	F();
	TD();
}

void TD()
{
	if (tk == '*')
	{
		advance();
		F();
		T();
	}
}

void F()
{
	if (tk == '(')
	{
		advance();
		E();
		if (tk == ')')
		{
			advance();
		}
	}
	else
	{
		if (tk == 'i')
		{
			advance();
		}
	}
}

int main()
{

	while (1)
	{
		cout << "\nEnter the string: ";
		cin >> s;
		tk = s[pt]; // imp step
		E();
		if (s[pt] == '\0')
			cout << "String is ACCEPTED\n";
		else
			cout << "String is NOT ACCEPTED\n";
		int choice;
		cout << "Do you want to continue? (1--yes |  0--no )" << endl;
		cin >> choice;
		if (choice == 0)
			exit(0);
		pt = 0;
	}
	return 0;
}
