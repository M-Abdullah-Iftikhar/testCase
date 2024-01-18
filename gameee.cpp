#include <iostream>
#include <windows.h>
#include <conio.h>
#include <fstream>
#include <string>

using namespace std;
//
//
//
///////////////////////////////////////////////////////////
// game functions
/////////////////////////////////////////////////////////
//
bool startGame(int nextLevel);
bool nextStage();

char getCharAtxy(short int x, short int y);
bool gotoxy(int x, int y);
bool header();
bool loadingScreen();
bool loading();
bool instructions();
string optionSelect();
bool printGameover();
bool press();
//
////////////////////////////////////////////////////////////
// palletes
/////////////////////////////////////////////////////////////
//
bool generateLifePalate();
bool generatePalate();
bool generateTrap();
//
////////////////////////////////////////////////////////////
// pallate Variables
/////////////////////////////////////////////////////////////
//
char diamond = 4;
int lifePalletSpeed = 0;
int lifePalletSpeedLimit = 5000;

char heart = 3;
int palletSpeed = 1;
int palletSpeedLimit = 1000;

char trap = 15;
int trapSpeed = 1;
int trapSpeedLimit = 200;
//
/////////////////////////////////////////////////////////
// Store & Load Funtions
//////////////////////////////////////////////////////////
//
string getField(string record, int field);
bool storeCharacterData();
bool loadCharacterData();
bool loadCharacterHelper(string dracoActive_, string snapeActive_, string sauronActive_, string seriusBlackActive_);
//
/////////////////////////////////////////////////
// colors
///////////////////////////////////////////////////////
//
HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
bool lightBlue();
bool lightRed();
bool pink();
bool yellow();
bool white();
bool grey();
bool blue();
bool green();
bool red();
//
////////////////////////////////////////////////////
// Mazes
//////////////////////////////////////////////////////
//
bool printMaze1();
bool printMaze2();
bool printMaze3();
bool printMaze4();
bool printMaze5();
bool printMaze6();
bool printMaze7();
bool printMaze8();

bool printBox1(int x, int y);
bool printBox2(int x, int y);
bool printBox3(int x, int y);
bool printBox4(int x, int y);
bool printBox5(int x, int y);
bool printBox6(int x, int y);
bool printBox7(int x, int y);
//
//////////////////////////////
// Game Variables
/////////////////////////////
//
int level = 1;
bool logout;
char lifeBar = 219;
//
////////////////////////////////////////////////////////////////
// eragon functions
////////////////////////////////////////////////////////////
//
bool callEragon();
bool eraseEragon(int x, int y);
bool printEragon(int x, int y);

bool eragonMove();
bool moveLeft();
bool moveRight();
bool moveUp();
bool moveDown();

bool eragonGenerateBullet();
bool eraseEragonBullet(int x, int y);
bool printEragonBullet(int x, int y);
bool eragonMoveBullet();

bool printEragonScore();
bool printEragonStatus();
bool eragonLife();

bool eragonCollision();
bool eragonDracoCollision();
bool eragonSnapeCollision();
bool eragonSauronCollision();
bool eragonSeriusBlackCollision();

bool eragonGenerateBulletL();
bool eraseEragonBulletL(int x, int y);
bool printEragonBulletL(int x, int y);
bool eragonMoveBulletL();

bool eragonDeleteBullet(int x);
//
///////////////////////////////////////////////////////////////
// Eragon variables
//////////////////////////////////////////////////////////////
//
int eragonX = 10;
int eragonY = 3;
bool eragonActive = true;
bool eragonchangeHealth = true;
bool eragonChangeLives = true;
int eragonScore = 0;
int eragonHealth = 20;
int eragonMaxHealth = 20;
int eragonLives = 3;
int eragonMaxLives = 3;

int eragonBulletX[10000];
int eragonBulletY[10000];
bool isActiveEragon[10000];
int eragonBulletCount = 0;

int eragonBulletLX[10000];
int eragonBulletLY[10000];
bool isActiveEragonL[10000];
int eragonBulletCountL = 0;

int eragonShotSpeed = 0;
int eragonShotSpeedLimit = 5;
int eragonShotSpeedR = 0;
int eragonShotSpeedLimitR = 5;
//
///////////////////////////////////////////////////////
// Draco Functions
////////////////////////////////////////////////////////
//
bool callDraco();
bool eraseDraco(int x, int y);
bool printDraco(int x, int y);

bool dracoMove();
bool moveLeftDraco();
bool moveRightDraco();
bool moveUpDraco();
bool moveDownDraco();

bool dracoCollision();
bool printDracoHealth();
bool deleteDraco();

bool dracoGenerateBullet();
bool eraseDracoBullet(int x, int y);
bool printDracoBullet(int x, int y);
bool dracoMoveBullet();
bool dracoDeleteBullet();
//
////////////////////////////////////////////////////////////
// Draco variables
/////////////////////////////////////////////////////////////
//
int dracoX = 80;
int dracoY = 3;
int dracoHealth = 0;
int dracoMaxHealth = 20;
bool dracoActive = false;
bool dracoChangeHealth = false;

int dracoBulletX[10000];
int dracoBulletY[10000];
bool isActiveDraco[10000];
int dracoBulletCount = 0;

int dracoShotCount = 0;
int dracoShotSpeed = 10;
int dracoSpeed = 0;
int dracoSpeedLimit = 3;
//
//////////////////////////////////////////////////////////
// Snape Functions
////////////////////////////////////////////////////////////
//
bool callSnape();
bool eraseSnape(int x, int y);
bool printSnape(int x, int y);

bool snapeMove();
bool moveLeftSnape();
bool moveRightSnape();
bool moveUpSnape();
bool moveDownSnape();

bool snapeGenerateBullet();
bool eraseSnapeBullet(int x, int y);
bool printSnapeBullet(int x, int y);
bool snapeMoveBullet();

bool snapeGenerateBulletL();
bool eraseSnapeBulletL(int x, int y);
bool printSnapeBulletL(int x, int y);
bool snapeMoveBulletL();

bool snapeDeleteBullet();

bool snapeCollision();
bool printSnapeHealth();
bool deleteSnape();
//
//////////////////////////////////////////////////
// Snape variables
/////////////////////////////////////////////////
//
int snapeX = 50;
int snapeY = 10;
int snapeHealth = 0;
int snapeMaxHealth = 20;
bool snapeActive = false;
bool snapeChangeHealth = false;
int randomSnape;
int randomSnapeDelay;

int snapeBulletX[10000];
int snapeBulletY[10000];
bool isActiveSnape[10000];
int snapeBulletCount = 0;
int snapeShotCountR = 0;
int snapeShotSpeedR = 7;

int snapeBulletLX[10000];
int snapeBulletLY[10000];
bool isActiveSnapeL[10000];
int snapeBulletCountL = 0;
int snapeShotCountL = 0;
int snapeShotSpeedL = 8;

int snapeScore = 0;
int snapeSpeed = 0;
int snapeSpeedLimit = 3;
//
/////////////////////////////////////////////////////
// Sauron Functions
///////////////////////////////////////////////////
//
bool callSauron();
bool eraseSauron(int x, int y);
bool printSauron(int x, int y);

bool sauronMove();
bool moveLeftSauron();
bool moveRightSauron();
bool moveUpSauron();
bool moveDownSauron();

bool sauronGenerateBullet();
bool eraseSauronBullet(int x, int y);
bool printSauronBullet(int x, int y);
bool sauronMoveBullet();

bool sauronGenerateBulletL();
bool eraseSauronBulletL(int x, int y);
bool printSauronBulletL(int x, int y);
bool sauronMoveBulletL();

bool sauronDeleteBullet();

bool sauronCollision();
bool printSauronHealth();
bool deleteSauron();
//
//////////////////////////////////////////////
// Sauron variables
////////////////////////////////////////////
//
int sauronX = 50;
int sauronY = 15;
int sauronHealth = 0;
int sauronMaxHealth = 20;
bool sauronActive = false;
bool sauronChangeHealth = false;
int randomSauron;
int randomSauronDelay;

int sauronBulletX[10000];
int sauronBulletY[10000];
bool isActiveSauron[10000];
int sauronBulletCount = 0;
int sauronShotCountR = 0;
int sauronShotSpeedR = 15;

int sauronBulletLX[10000];
int sauronBulletLY[10000];
bool isActiveSauronL[10000];
int sauronBulletCountL = 0;
int sauronShotCountL = 0;
int sauronShotSpeedL = 14;

int sauronScore = 0;
int sauronSpeed = 0;
int sauronSpeedLimitRightLeft = 5;
int sauronSpeedLimitUpDown = 3;
//
////////////////////////////////////////////////
// seriusBlack Functions
/////////////////////////////////////////////
//
bool callSeriusBlack();
bool eraseSeriusBlack(int x, int y);
bool printSeriusBlack(int x, int y);

bool seriusBlackMove();
bool moveLeftSeriusBlack();
bool moveRightSeriusBlack();
bool moveUpSeriusBlack();
bool moveDownSeriusBlack();

bool seriusBlackGenerateBullet();
bool eraseSeriusBlackBullet(int x, int y);
bool printSeriusBlackBullet(int x, int y);
bool seriusBlackMoveBullet();

bool seriusBlackGenerateBulletL();
bool eraseSeriusBlackBulletL(int x, int y);
bool printSeriusBlackBulletL(int x, int y);
bool seriusBlackMoveBulletL();

bool seriusBlackGenerateBulletFollow();
bool eraseSeriusBlackBulletFollow(int x, int y);
bool printSeriusBlackBulletFollow(int x, int y);
bool seriusBlackMoveBulletFollow();

bool seriusBlackDeleteBullet();

bool seriusBlackCollision();
bool printSeriusBlackHealth();
bool deleteSeriusBlack();
//
//////////////////////////////////////
// seriusBlack variables
//////////////////////////////////////
//
int seriusBlackX = 50;
int seriusBlackY = 15;
int seriusBlackHealth = 0;
int seriusBlackMaxHealth = 20;
int seriusBlackLives = 5;
bool seriusBlackActive = false;
bool seriusBlackChangeHealth = false;
int randomSeriusBlack;
int randomSeriusBlackDelay;
string verticalDirectionSeriusBlack = "down";

int seriusBlackBulletX[10000];
int seriusBlackBulletY[10000];
bool isActiveSeriusBlack[10000];
int seriusBlackBulletCount = 0;
int seriusBlackShotCountR = 0;
int seriusBlackShotSpeedR = 15;
int seriusBlackBulletRSpeed = 0;
int seriusBlackBulletRSpeedLimit = 2;

int seriusBlackBulletLX[10000];
int seriusBlackBulletLY[10000];
bool isActiveSeriusBlackL[10000];
int seriusBlackBulletCountL = 0;
int seriusBlackShotCountL = 0;
int seriusBlackShotSpeedL = 14;
int seriusBlackBulletLSpeed = 0;
int seriusBlackBulletLSpeedLimit = 2;

int seriusBlackBulletFX[10000];
int seriusBlackBulletFY[10000];
bool isActiveSeriusBlackF[10000];
int seriusBlackBulletCountF = 0;
int seriusBlackShotCountF = 0;
int seriusBlackShotSpeedF = 40;
int seriusBlackBulletFSpeed = 0;
int seriusBlackBulletFSpeedLimit = 3;

int seriusBlackScore = 0;
int seriusBlackSpeed = 0;
int seriusBlackSpeedLimitRL = 5;
int seriusBlackSpeedLimitUD = 2;

//
//
//
//
//
//
//
//
///////////////////////////////////////
int main()
{
    loadingScreen();
    while (true)
    {
        string choice;

        choice = optionSelect();

        if (choice == "4")
        {
            system("cls");
            cout << "Thanks for using this App" << endl;
            press();
        }
        else if (choice == "1")
        {
            callEragon();
            startGame(level);
            loadingScreen();
        }
        else if (choice == "2")
        {
            eragonActive = true;
            loadCharacterData();
            startGame(level);
            loadingScreen();
        }
        else if (choice == "3")
        {
            instructions();
        }
    }
}
///////////////////////////////////////
//
//
//
//
//
//
//
//
//
////////////////////////////////////////////////////
// Game Functions
///////////////////////////////////////////////////////
//
bool gotoxy(int x, int y)
{
    COORD coordinates;
    coordinates.X = x;
    coordinates.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coordinates);
}
char getCharAtxy(short int x, short int y)
{
    CHAR_INFO ci;
    COORD xy = { 0, 0 };
    SMALL_RECT rect = { x, y, x, y };
    COORD coordBufSize;
    coordBufSize.X = 1;
    coordBufSize.Y = 1;
    return ReadConsoleOutput(GetStdHandle(STD_OUTPUT_HANDLE), &ci, coordBufSize, xy, &rect) ? ci.Char.AsciiChar : ' ';
}

string optionSelect()
{
    string choice;

    while (true)
    {
        white();
        system("cls");
        header();
        cout << endl;
        grey();
        cout << "Press 1 to Start the game " << endl;
        cout << "Press 2 to continue Previous Game" << endl;
        cout << "Press 3 to enter the Option menu" << endl;
        cout << "Press 4 to exit " << endl;
        ;
        cin >> choice;
        if (choice == "1" || choice == "2" || choice == "3" || choice == "4")
        {
            break;
        }
        else
        {
            cout << "Please enter a valid option" << endl;
            press();
        }
    }

    return choice;
}
bool startGame(int nextLevel)
{
    bool goBack = false;
    while (true)
    {
        eragonX = 10;
        eragonY = 3;
        eragonchangeHealth = true;
        goBack = false;
        nextLevel = level;
        if (level > 4)
        {
            level = 1;
            system("cls");
            cout << "For Now Game Ends Here" << endl;
            break;
        }
        if (nextLevel == 1)
        {
            system("cls");
           // cout << endl;
            printMaze1();

            // Eragon

            printEragon(eragonX, eragonY);

            // Draco

            callDraco();
        }
        else if (nextLevel == 2)
        {
            system("cls");
            //cout << endl;
            printMaze2();

            // Eragon

            printEragon(eragonX, eragonY);

            // Draco

            callDraco();

            // Snape

            callSnape();
        }
        else if (nextLevel == 3)
        {
            system("cls");
            //cout << endl;
            printMaze4();

            // Eragon

            printEragon(5, 5);

            // Draco

            callDraco();
            // Snape

            callSnape();

            // Sauron

            callSauron();
        }
        else if (nextLevel == 4)
        {
            system("cls");
            //cout << endl;
            printMaze5();

            // Eragon

            printEragon(5, 5);

            callSeriusBlack();
        }

        while (true)
        {

            if (GetAsyncKeyState(VK_ESCAPE))
            {
                storeCharacterData();
                goBack = true;
                break;
            }
            if (eragonActive == false)
            {
                goBack = true;
                break;
            }

            // Palletes

            generateLifePalate();
            generatePalate();
            generateTrap();

            // Eragon

            eragonMove();
            printEragonScore();
            eragonCollision();
            printEragonStatus();
            eragonLife();

            // Draco

            deleteDraco();
            if (dracoActive == true)
            {
                dracoGenerateBullet();
                dracoMove();
                dracoCollision();
            }

            printDracoHealth();
            dracoMoveBullet();

            // Snape Functions

            deleteSnape();
            if (snapeActive == true)
            {
                snapeGenerateBullet();
                snapeGenerateBulletL();
                snapeMove();
                snapeCollision();
            }
            printSnapeHealth();
            snapeMoveBullet();
            snapeMoveBulletL();

            // Sauron Functions

            deleteSauron();
            if (sauronActive == true)
            {
                sauronGenerateBullet();
                sauronGenerateBulletL();
                sauronMove();
                sauronCollision();
            }
            printSauronHealth();
            sauronMoveBullet();
            sauronMoveBulletL();

            // SeriusBlack Functions

            deleteSeriusBlack();
            if (seriusBlackActive == true)
            {
                seriusBlackGenerateBullet();
                seriusBlackGenerateBulletL();
                seriusBlackGenerateBulletFollow();
                seriusBlackMove();
                seriusBlackCollision();
            }
            printSeriusBlackHealth();
            seriusBlackMoveBullet();
            seriusBlackMoveBulletL();
            seriusBlackMoveBulletFollow();

            // eragon Move Bullets
            eragonMoveBullet();
            eragonMoveBulletL();

            if (dracoHealth <= 0 && snapeHealth <= 0 && sauronHealth <= 0 && seriusBlackHealth == 0)
            {
                Sleep(3000);
                nextStage();
                break;
            }
            if (seriusBlackHealth == 40 && level == 4)
            {
                callDraco();
            }
            if (seriusBlackHealth == 25 && level == 4)
            {
                callSnape();
            }

            storeCharacterData();
            Sleep(50);
        }
        if (goBack == true)
        {
            break;
        }
    }
}
bool nextStage()
{

    green();

    system("cls");
    cout << endl
        << endl;

    cout << "                         :::        :::::::::: :::     ::: :::::::::: :::                        " << endl;
    cout << "                        :+:        :+:        :+:     :+: :+:        :+:                         " << endl;
    cout << "                       +:+        +:+        +:+     +:+ +:+        +:+                          " << endl;
    cout << "                      +#+        +#++:++#   +#+     +:+ +#++:++#   +#+                           " << endl;
    cout << "                     +#+        +#+         +#+   +#+  +#+        +#+                            " << endl;
    cout << "                    #+#        #+#          #+#+#+#   #+#        #+#                             " << endl;
    cout << "                   ########## ##########     ###     ########## ##########                       " << endl;
    cout << "      ::::::::   ::::::::    :::   :::   :::::::::  :::        :::::::::: ::::::::::: :::::::::: " << endl;
    cout << "    :+:    :+: :+:    :+:  :+:+: :+:+:  :+:    :+: :+:        :+:            :+:     :+:         " << endl;
    cout << "   +:+        +:+    +:+ +:+ +:+:+ +:+ +:+    +:+ +:+        +:+            +:+     +:+          " << endl;
    cout << "  +#+        +#+    +:+ +#+  +:+  +#+ +#++:++#+  +#+        +#++:++#       +#+     +#++:++#      " << endl;
    cout << " +#+        +#+    +#+ +#+       +#+ +#+        +#+        +#+            +#+     +#+            " << endl;
    cout << "#+#    #+# #+#    #+# #+#       #+# #+#        #+#        #+#            #+#     #+#             " << endl;
    cout << "########   ########  ###       ### ###        ########## ##########     ###     ##########       " << endl;
    cout << endl;
    loading();
    cout << "Press any key to proceed to next level";
    getch();
    level++;
}
bool header()
{
    blue();
    cout << endl;
    cout << endl;
    cout << "oooooo   oooooo     oooo ooooo  oooooooooooo       .o.       ooooooooo.   oooooooooo.   ooooo ooooo      ooo   .oooooo.         " << endl;
    cout << " `888.    `888.     .8'  `888'  d''''''d888'      .888.      `888   `Y88. `888'   `Y8b  `888' `888b.     `8'  d8P'  `Y8b        " << endl;
    cout << "  `888.   .8888.   .8'    888        .888P       .8'888.      888   .d88'  888      888  888   8 `88b.    8  888                " << endl;
    cout << "   `888  .8'`888. .8'     888       d888'       .8' `888.     888ooo88P'   888      888  888   8   `88b.  8  888                " << endl;
    cout << "    `888.8'  `888.8'      888     .888P        .88ooo8888.    888`88b.     888      888  888   8     `88b.8  888     ooooo      " << endl;
    cout << "     `888'    `888'       888    d888'    P   .8'     `888.   888  `88b.   888     d88'  888   8       `888  `88.    .88'       " << endl;
    cout << "      `8'      `8'       o888o .8888888888P  o88o     o8888o o888o  o888o o888bood8P'   o888o o8o        `8   `Y8bood8P'        " << endl;
    cout << "                                                                                                                                " << endl;
    cout << "                                                                                                                                " << endl;
    cout << "                                                                                                                                " << endl;
    cout << "          oooooo   oooooo     oooo   .oooooo.   ooooooooo.   ooooo        oooooooooo.                                           " << endl;
    cout << "           `888.    `888.     .8'   d8P'  `Y8b  `888   `Y88. `888'        `888'   `Y8b                                          " << endl;
    cout << "            `888.   .8888.   .8'   888      888  888   .d88'  888          888      888                                         " << endl;
    cout << "             `888  .8'`888. .8'    888      888  888ooo88P'   888          888      888                                         " << endl;
    cout << "              `888.8'  `888.8'     888      888  888`88b.     888          888      888                                         " << endl;
    cout << "               `888'    `888'      `88b    d88'  888  `88b.   888       o  888     d88'                                         " << endl;
    cout << "                `8'      `8'        `Y8bood8P'  o888o  o888o o888ooooood8 o888bood8P'     " << endl;
    cout << "" << endl;
}
bool loadingScreen()
{
    system("cls");
    header();
    loading();
}
bool loading()
{
    char a = 219;
    cout << endl;
    cout << "Loading " << a;
    Sleep(300);
    cout << a;
    Sleep(100);
    cout << a << a;
    Sleep(400);
    cout << a;
    Sleep(500);
    cout << a << a << a;
    Sleep(100);
    cout << a;
    Sleep(100);
    cout << a;
    Sleep(200);
    cout << a;
    Sleep(800);
    cout << a;
}
bool instructions()
{
    system("cls");

    cout << "Use arrow keys to move left,right,up and down:" << endl;
    cout << "Hold space to fire left and Hold Ctrl to fire right: " << endl;
    cout << "game will stop for 3 second after clearing a level(for Now): " << endl;
    cout << "there are 4 stages for now: " << endl;
    press();
}
bool printGameover()
{
    red();

    cout << endl
        << endl;
    cout << "     /\\\\\\\\\\\\\\\\\\\\\\\\     /\\\\\\\\\\\\\\\\\\     /\\\\\\\\            /\\\\\\\\  /\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\                    " << endl;
    cout << "    /\\\\\\//////////    /\\\\\\\\\\\\\\\\\\\\\\\\\\  \\/\\\\\\\\\\\\        /\\\\\\\\\\\\ \\/\\\\\\///////////                    " << endl;
    cout << "    /\\\\\\              /\\\\\\/////////\\\\\\ \\/\\\\\\//\\\\\\    /\\\\\\//\\\\\\ \\/\\\\\\                              " << endl;
    cout << "    \\/\\\\\\    /\\\\\\\\\\\\\\ \\/\\\\\\       \\/\\\\\\ \\/\\\\\\\\///\\\\\\/\\\\\\/ \\/\\\\\\ \\/\\\\\\\\\\\\\\\\\\\\\\                     " << endl;
    cout << "     \\/\\\\\\   \\/////\\\\\\ \\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \\/\\\\\\  \\///\\\\\\/   \\/\\\\\\ \\/\\\\\\///////                     " << endl;
    cout << "      \\/\\\\\\       \\/\\\\\\ \\/\\\\\\/////////\\\\\\ \\/\\\\\\    \\///     \\/\\\\\\ \\/\\\\\\                           " << endl;
    cout << "       \\/\\\\\\       \\/\\\\\\ \\/\\\\\\       \\/\\\\\\ \\/\\\\\\             \\/\\\\\\ \\/\\\\\\                          " << endl;
    cout << "        \\//\\\\\\\\\\\\\\\\\\\\\\\\/  \\/\\\\\\       \\/\\\\\\ \\/\\\\\\             \\/\\\\\\ \\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\             " << endl;
    cout << "          \\////////////    \\///        \\///  \\///              \\///  \\///////////////             " << endl;
    cout << "       /\\\\\\\\\\       /\\\\\\        /\\\\\\  /\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\    /\\\\\\\\\\\\\\\\\\                              " << endl;
    cout << "      /\\\\\\///\\\\\\    \\/\\\\\\       \\/\\\\\\ \\/\\\\\\///////////   /\\\\\\///////\\\\\\                           " << endl;
    cout << "     /\\\\\\/  \\///\\\\\\  \\//\\\\\\      /\\\\\\  \\/\\\\\\             \\/\\\\\\     \\/\\\\\\                          " << endl;
    cout << "     /\\\\\\      \\//\\\\\\  \\//\\\\\\    /\\\\\\   \\/\\\\\\\\\\\\\\\\\\\\\\     \\/\\\\\\\\\\\\\\\\\\\\\\/                          " << endl;
    cout << "     \\/\\\\\\       \\/\\\\\\   \\//\\\\\\  /\\\\\\    \\/\\\\\\///////      \\/\\\\\\//////\\\\\\                         " << endl;
    cout << "      \\//\\\\\\      /\\\\\\     \\//\\\\\\/\\\\\\     \\/\\\\\\             \\/\\\\\\    \\//\\\\\\                       " << endl;
    cout << "        \\///\\\\\\  /\\\\\\        \\//\\\\\\\\\\      \\/\\\\\\             \\/\\\\\\     \\//\\\\\\                     " << endl;
    cout << "           \\///\\\\\\\\\\/          \\//\\\\\\       \\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ \\/\\\\\\      \\//\\\\\\                   " << endl;
    cout << "              \\/////             \\///        \\///////////////  \\///        \\///    " << endl;
    cout << endl
        << endl;
}
//
///////////////////////////////////////////////////////
// Pallet Functions
//////////////////////////////////////////////////////////
//
bool generateLifePalate()
{
    lightBlue();
    if (lifePalletSpeed % lifePalletSpeedLimit == 0)
    {
        int x = rand() % 110;
        int y = rand() % 34;
        char next = getCharAtxy(x, y);
        if (next == ' ')
        {
            gotoxy(x, y);
            cout << diamond;
        }
    }

    lifePalletSpeed++;
}
bool generatePalate()
{
    red();
    if (palletSpeed % palletSpeedLimit == 0)
    {
        int x = rand() % 110;
        int y = rand() % 34;
        char next = getCharAtxy(x, y);
        if (next == ' ')
        {
            gotoxy(x, y);
            cout << heart;
        }
    }

    palletSpeed++;
}
bool generateTrap()
{
    pink();
    if (trapSpeed % trapSpeedLimit == 0)
    {
        int x = rand() % 110;
        int y = rand() % 34;
        char next = getCharAtxy(x, y);
        if (next == ' ')
        {
            gotoxy(x, y);
            cout << trap;
        }
    }
    trapSpeed++;
}
//
///////////////////////////////////////////////////
// colors
////////////////////////////////////////////////
//
bool lightBlue()
{
    SetConsoleTextAttribute(h, 3);
}
bool lightRed()
{
    SetConsoleTextAttribute(h, 4);
}
bool pink()
{
    SetConsoleTextAttribute(h, 5);
}
bool yellow()
{
    SetConsoleTextAttribute(h, 6);
}
bool white()
{
    SetConsoleTextAttribute(h, 7);
}
bool grey()
{
    SetConsoleTextAttribute(h, 8);
}
bool blue()
{
    SetConsoleTextAttribute(h, 9);
}
bool green()
{
    SetConsoleTextAttribute(h, 10);
}
bool red()
{
    SetConsoleTextAttribute(h, 12);
}
bool lightYellow()
{
    SetConsoleTextAttribute(h, 14);
}
//
/////////////////////////////////////////////////
// Mazes
/////////////////////////////////////////////////
//
bool printMaze1()
{
    grey();
    char maze[34][110];
    char wall = 219;
    //cout << endl
        //<< endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }
    printBox1(8, 6);
    printBox1(26, 7);
    printBox1(41, 6);
    printBox5(56, 7);
    printBox6(71, 6);
    printBox1(77, 7);
    printBox4(95, 6);

    printBox1(20, 13);
    printBox4(40, 13);
    printBox2(65, 13);
    printBox3(85, 13);
    printBox7(95, 13);

    printBox1(8, 19);
    printBox7(26, 21);
    printBox5(41, 19);
    printBox1(56, 19);
    printBox4(71, 21);
    printBox1(82, 19);
    printBox4(96, 22);

    printBox1(15, 27);
    printBox4(43, 26);
    printBox6(67, 27);
    printBox5(86, 27);
    printBox6(97, 29);
}
bool printMaze2()
{
    char wall = 219;
    grey();
    char maze[34][110];
    //cout << endl
        //<< endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }
    printBox1(8, 6);
    printBox1(26, 7);
    printBox1(41, 6);
    printBox1(77, 7);
    printBox4(95, 6);

    printBox1(20, 13);
    printBox4(40, 13);
    printBox3(85, 14);
    printBox7(95, 13);

    printBox1(8, 19);
    printBox7(26, 21);
    printBox5(41, 19);
    printBox1(82, 19);
    printBox4(96, 22);

    printBox1(15, 27);
    printBox4(43, 26);
    printBox5(86, 27);
    printBox6(97, 29);
}
bool printMaze3()
{
    char wall = 219;
    grey();
    char maze[34][110];
    //cout << endl
       // << endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }
    printBox1(26, 7);
    printBox1(41, 6);
    printBox6(71, 6);
    printBox4(95, 6);

    printBox1(20, 13);
    printBox3(85, 13);
    printBox7(95, 13);

    printBox1(8, 19);
    printBox7(26, 21);
    printBox1(82, 19);
    printBox4(96, 22);

    printBox1(15, 27);
    printBox4(43, 26);
    printBox6(97, 29);
}
bool printMaze4()
{
    char wall = 219;
    grey();
    char maze[34][110];
    //cout << endl
        //<< endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }
    printBox5(56, 7);
    printBox6(71, 6);
    printBox4(95, 6);

    printBox1(20, 13);
    printBox4(40, 13);

    printBox1(8, 19);
    printBox1(82, 19);
    printBox4(96, 22);

    printBox1(15, 27);
    printBox6(97, 29);
}
bool printMaze5()
{
    char wall = 219;
    grey();
    char maze[34][110];

   // cout << endl
       // << endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }
    printBox5(56, 7);
    printBox6(71, 6);

    printBox4(40, 13);

    printBox1(8, 19);
    printBox4(96, 22);

    printBox6(97, 29);
}
bool printMaze6()
{
    char wall = 219;
    grey();
    char maze[34][110];

   // cout << endl
      //  << endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }
    printBox5(56, 7);

    printBox4(40, 13);

    printBox1(8, 19);

    printBox6(97, 29);
}
bool printMaze7()
{
    char wall = 219;
    grey();
    char maze[34][110];

    //cout << endl
        //<< endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }

    printBox4(40, 13);

    printBox1(8, 19);
}
bool printMaze8()
{
    char wall = 219;
    grey();

    char maze[34][110];

    //cout << endl
       // << endl;
    for (int y = 0; y < 34; y++)
    {
        for (int x = 0; x < 110; x++)
        {
            if (x == 0 || x == 109 || y == 1 || y == 33)
            {
                maze[y][x] = wall;
            }
            else
            {
                maze[y][x] = ' ';
            }

            cout << maze[y][x];
        }
        cout << endl;
    }

    printBox4(40, 14);

    printBox1(40, 17);

    printBox6(40, 20);
}

bool printBox1(int x, int y)
{
    grey();
    char box[4][7] = { {' ', ' ', '+', '-', '+', ' ', ' '},
                      {'<', '-', '|', ' ', '|', '-', '>'},
                      {' ', ' ', '+', '-', '+', ' ', ' '},
                      {' ', ' ', ' ', 'V', ' ', ' ', ' '} };

    for (int a = 0; a < 4; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 7; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
bool printBox2(int x, int y)
{
    grey();
    char box[5][5] = { {'+', '-', '+', ' ', ' '},
                      {'|', ' ', '|', '-', '>'},
                      {'+', '-', '+', ' ', ' '},
                      {' ', '|', ' ', ' ', ' '},
                      {' ', 'v', ' ', ' ', ' '} };

    for (int a = 0; a < 5; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 5; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
bool printBox3(int x, int y)
{
    grey();
    char box[3][5] = { {'+', '-', '+', ' ', ' '},
                      {'|', ' ', '|', '-', '>'},
                      {'+', '-', '+', ' ', ' '} };

    for (int a = 0; a < 3; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 5; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
bool printBox4(int x, int y)
{
    grey();
    char box[3][7] = { {' ', ' ', '+', '-', '+', ' ', ' '},
                      {'<', '-', '|', ' ', '|', '-', '>'},
                      {' ', ' ', '+', '-', '+', ' ', ' '} };

    for (int a = 0; a < 3; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 7; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
bool printBox5(int x, int y)
{
    grey();
    char box[5][3] = { {'+', '-', '+'},
                      {'|', ' ', '|'},
                      {'+', '-', '+'},
                      {' ', '|', ' '},
                      {' ', 'v', ' '} };

    for (int a = 0; a < 5; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 3; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
bool printBox6(int x, int y)
{
    grey();
    char box[3][5] = { {' ', ' ', '+', '-', '+'},
                      {'<', '-', '|', ' ', '|'},
                      {' ', ' ', '+', '-', '+'} };

    for (int a = 0; a < 3; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 5; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
bool printBox7(int x, int y)
{
    grey();
    char box[5][5] = { {' ', ' ', '+', '-', '+'},
                      {'<', '-', '|', ' ', '|'},
                      {' ', ' ', '+', '-', '+'},
                      {' ', ' ', ' ', '|', ' '},
                      {' ', ' ', ' ', 'v', ' '} };

    for (int a = 0; a < 5; a++)
    {
        gotoxy(x, y + a);
        for (int b = 0; b < 5; b++)
        {
            cout << box[a][b];
        }
        cout << endl;
    }
}
//
//
///////////////////////////////////////////////////
// Eragon Functions
/////////////////////////////////////////////////////
//
//
bool callEragon()
{
    eragonX = 10;
    eragonY = 3;
    
    eragonHealth = 20;
    eragonLives = 3;
    eragonActive = true;
    eragonChangeLives = true;
    eragonScore = 0;
}
bool eragonMove()
{
    if (GetAsyncKeyState(VK_LEFT))
    {
        moveLeft();
    }

    if (GetAsyncKeyState(VK_RIGHT))
    {

        moveRight();
    }

    if (GetAsyncKeyState(VK_UP))
    {
        moveUp();
    }

    if (GetAsyncKeyState(VK_DOWN))
    {

        moveDown();
    }

    if (GetAsyncKeyState(VK_SPACE))
    {
        eragonGenerateBullet();
    }
    if (GetAsyncKeyState(VK_CONTROL))
    {
        eragonGenerateBulletL();
    }
}
bool moveLeft()
{
    char nextLocation1 = getCharAtxy(eragonX - 1, eragonY);
    char nextLocation2 = getCharAtxy(eragonX - 1, eragonY + 1);
    char nextLocation3 = getCharAtxy(eragonX - 1, eragonY + 2);
    if (nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ')
    {
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX - 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth + 5;
        eragonScore = eragonScore + 5;
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX - 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond)
    {
        eragonchangeHealth = true;
        if (eragonLives == eragonMaxLives)
        {
            eragonMaxLives++;
        }
        eragonLives++;
        eragonScore = eragonScore + 10;
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX - 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == trap || nextLocation2 == trap || nextLocation3 == trap)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth - 5;
        eragonScore = eragonScore - 5;
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX - 1;
        printEragon(eragonX, eragonY);
    }
}
bool moveRight()
{
    char nextLocation1 = getCharAtxy(eragonX + 3, eragonY);
    char nextLocation2 = getCharAtxy(eragonX + 3, eragonY + 1);
    char nextLocation3 = getCharAtxy(eragonX + 3, eragonY + 2);
    if (nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ')
    {
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX + 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth + 5;
        eragonScore = eragonScore + 5;
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX + 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond)
    {
        if (eragonLives == eragonMaxLives)
        {
            eragonMaxLives++;
        }
        eragonchangeHealth = true;
        eragonLives++;
        eragonScore = eragonScore + 10;
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX + 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == trap || nextLocation2 == trap || nextLocation3 == trap)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth - 5;
        eragonScore = eragonScore - 5;
        eraseEragon(eragonX, eragonY);
        eragonX = eragonX + 1;
        printEragon(eragonX, eragonY);
    }
}
bool moveUp()
{
    char nextLocation1 = getCharAtxy(eragonX, eragonY - 1);
    char nextLocation2 = getCharAtxy(eragonX + 1, eragonY - 1);
    char nextLocation3 = getCharAtxy(eragonX + 2, eragonY - 1);
    if (nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ')
    {
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY - 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth + 5;
        eragonScore = eragonScore + 5;
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY - 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond)
    {
        eragonchangeHealth = true;
        if (eragonLives == eragonMaxLives)
        {
            eragonMaxLives++;
        }
        eragonLives++;
        eragonScore = eragonScore + 10;
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY - 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == trap || nextLocation2 == trap || nextLocation3 == trap)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth - 5;
        eragonScore = eragonScore - 5;
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY - 1;
        printEragon(eragonX, eragonY);
    }
}
bool moveDown()
{
    char nextLocation1 = getCharAtxy(eragonX, eragonY + 3);
    char nextLocation2 = getCharAtxy(eragonX + 1, eragonY + 3);
    char nextLocation3 = getCharAtxy(eragonX + 2, eragonY + 3);
    if (nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ')
    {
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY + 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth + 5;
        eragonScore = eragonScore + 5;
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY + 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond)
    {
        eragonchangeHealth = true;
        if (eragonLives == eragonMaxLives)
        {
            eragonMaxLives++;
        }
        eragonLives++;
        eragonScore = eragonScore + 10;
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY + 1;
        printEragon(eragonX, eragonY);
    }
    else if (nextLocation1 == trap || nextLocation2 == trap || nextLocation3 == trap)
    {
        eragonchangeHealth = true;
        eragonHealth = eragonHealth - 5;
        eragonScore = eragonScore - 5;
        eraseEragon(eragonX, eragonY);
        eragonY = eragonY + 1;
        printEragon(eragonX, eragonY);
    }
}

bool eraseEragon(int x, int y)
{
    for (int x = 0; x < 3; x++)
    {
        gotoxy(eragonX, eragonY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << " ";
        }
    }
}
bool printEragon(int x, int y)
{
    green();
    char top = 147;
    char middle1 = 219, middle2 = 196;
    char bottom = 227;

    char eragon[3][3] = { {' ', top, ' '},
                         {middle2, middle1, middle2},
                         {' ', bottom, ' '} };

    for (int x = 0; x < 3; x++)
    {
        gotoxy(eragonX, eragonY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << eragon[x][y];
        }
    }
}

bool eragonGenerateBullet()
{
    char next = getCharAtxy(eragonX + 3, eragonY + 1);

    if (next == ' ')
    {
        if (eragonShotSpeed % eragonShotSpeedLimit == 0)
        {
            eragonBulletX[eragonBulletCount] = eragonX + 3;
            eragonBulletY[eragonBulletCount] = eragonY + 1;
            isActiveEragon[eragonBulletCount] = true;
            eragonBulletCount++;
            gotoxy(eragonX + 3, eragonY + 1);
            cout << ".";
        }
    }
    eragonShotSpeed++;
}
bool eraseEragonBullet(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printEragonBullet(int x, int y)
{
    bool green();
    gotoxy(x, y);
    cout << ".";
}
bool eragonMoveBullet()
{
    for (int x = 0; x < eragonBulletCount; x++)
    {
        if (isActiveEragon[x] == true)
        {
            char next = getCharAtxy(eragonBulletX[x] + 1, eragonBulletY[x]);
            if (next != ' ')
            {
                eraseEragonBullet(eragonBulletX[x], eragonBulletY[x]);
                isActiveEragon[x] = false;
            }
            else if (next == ' ')
            {
                eraseEragonBullet(eragonBulletX[x], eragonBulletY[x]);
                eragonBulletX[x] = eragonBulletX[x] + 1;
                printEragonBullet(eragonBulletX[x], eragonBulletY[x]);
            }
        }
    }
}

bool eragonGenerateBulletL()
{
    char next = getCharAtxy(eragonX - 1, eragonY + 1);

    if (next == ' ')
    {
        if (eragonShotSpeedR % eragonShotSpeedLimitR == 0)
        {
            eragonBulletLX[eragonBulletCountL] = eragonX - 1;
            eragonBulletLY[eragonBulletCountL] = eragonY + 1;
            isActiveEragonL[eragonBulletCountL] = true;
            eragonBulletCountL++;
            gotoxy(eragonX - 1, eragonY + 1);
            cout << ".";
        }
    }
    eragonShotSpeedR++;
}
bool eraseEragonBulletL(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printEragonBulletL(int x, int y)
{
    bool green();
    gotoxy(x, y);
    cout << ".";
}
bool eragonMoveBulletL()
{
    for (int x = 0; x < eragonBulletCountL; x++)
    {
        if (isActiveEragonL[x] == true)
        {
            char next = getCharAtxy(eragonBulletLX[x] - 1, eragonBulletLY[x]);
            if (next != ' ')
            {
                eraseEragonBulletL(eragonBulletLX[x], eragonBulletLY[x]);
                isActiveEragonL[x] = false;
            }
            else if (next == ' ')
            {
                eraseEragonBulletL(eragonBulletLX[x], eragonBulletLY[x]);
                eragonBulletLX[x] = eragonBulletLX[x] - 1;
                printEragonBulletL(eragonBulletLX[x], eragonBulletLY[x]);
            }
        }
    }
}

bool eragonCollision()
{
    eragonDracoCollision();
    eragonSnapeCollision();
    eragonSauronCollision();
    eragonSeriusBlackCollision();
}
bool eragonDracoCollision()
{
    for (int x = 0; x < dracoBulletCount; x++)
    {
        if (isActiveDraco[x] == true)
        {
            if (dracoBulletX[x] - 3 == eragonX && (dracoBulletY[x] == eragonY || dracoBulletY[x] == eragonY + 1 || dracoBulletY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
}
bool eragonSnapeCollision()
{
    for (int x = 0; x < snapeBulletCountL; x++)
    {
        if (isActiveSnapeL[x] == true)
        {
            if (snapeBulletLX[x] - 3 == eragonX && (snapeBulletLY[x] == eragonY || snapeBulletLY[x] == eragonY + 1 || snapeBulletLY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
    for (int x = 0; x < snapeBulletCount; x++)
    {
        if (isActiveSnape[x] == true)
        {
            if (snapeBulletX[x] + 1 == eragonX && (snapeBulletY[x] == eragonY || snapeBulletY[x] == eragonY + 1 || snapeBulletY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
}
bool eragonSauronCollision()
{
    for (int x = 0; x < sauronBulletCountL; x++)
    {
        if (isActiveSauronL[x] == true)
        {
            if (sauronBulletLX[x] - 3 == eragonX && (sauronBulletLY[x] == eragonY || sauronBulletLY[x] == eragonY + 1 || sauronBulletLY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
    for (int x = 0; x < sauronBulletCount; x++)
    {
        if (isActiveSauron[x] == true)
        {
            if (sauronBulletX[x] + 1 == eragonX && (sauronBulletY[x] == eragonY || sauronBulletY[x] == eragonY + 1 || sauronBulletY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
}
bool eragonSeriusBlackCollision()
{
    for (int x = 0; x < seriusBlackBulletCountL; x++)
    {
        if (isActiveSeriusBlackL[x] == true)
        {
            if (seriusBlackBulletLX[x] - 3 == eragonX && (seriusBlackBulletLY[x] == eragonY || seriusBlackBulletLY[x] == eragonY + 1 || seriusBlackBulletLY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
    for (int x = 0; x < seriusBlackBulletCount; x++)
    {
        if (isActiveSeriusBlack[x] == true)
        {
            if (seriusBlackBulletX[x] + 1 == eragonX && (seriusBlackBulletY[x] == eragonY || seriusBlackBulletY[x] == eragonY + 1 || seriusBlackBulletY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
    for (int x = 0; x < seriusBlackBulletCountF; x++)
    {
        if (isActiveSeriusBlackF[x] == true)
        {
            if (seriusBlackBulletFX[x] - 3 == eragonX && (seriusBlackBulletFY[x] == eragonY || seriusBlackBulletFY[x] == eragonY + 1 || seriusBlackBulletFY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
            else if (seriusBlackBulletFX[x] + 1 == eragonX && (seriusBlackBulletFY[x] == eragonY || seriusBlackBulletFY[x] == eragonY + 1 || seriusBlackBulletFY[x] == eragonY + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
            else if (seriusBlackBulletFY[x] - 1 == eragonY && (seriusBlackBulletFX[x] == eragonX || seriusBlackBulletFX[x] == eragonX + 1 || seriusBlackBulletFX[x] == eragonX + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
            else if (seriusBlackBulletFY[x] + 3 == eragonY && (seriusBlackBulletFX[x] == eragonX || seriusBlackBulletFX[x] == eragonX + 1 || seriusBlackBulletFX[x] == eragonX + 2))
            {
                eragonchangeHealth = true;
                eragonHealth--;
            }
        }
    }
}

bool printEragonScore()
{
    gotoxy(10, 0);
    if (eragonScore <= 0)
    {
        eragonScore = 0;
    }
    cout << "Score is: " << eragonScore << " ";
}
bool printEragonStatus()
{

    green();
    if (eragonchangeHealth == true)
    {
        gotoxy(113, 6);
        cout << "Eragon Remaining Lives: ";
        for (int x = 0; x < eragonMaxLives; x++)
        {
            grey();
            gotoxy(113 + 2 * x, 7);
            cout << heart << "   ";
        }
        for (int x = 0; x < eragonLives; x++)
        {
            red();
            gotoxy(113 + 2 * x, 7);
            cout << heart << " ";
        }
        green();
        gotoxy(113, 8);
        cout << "Eragon Health: ";
        for (int x = 0; x < eragonMaxHealth; x++)
        {
            grey();
            gotoxy(113 + x, 9);
            cout << lifeBar;
        }
        if (eragonHealth > eragonMaxHealth)
        {
            eragonHealth = eragonMaxHealth;
        }
        for (int x = 0; x < eragonHealth; x++)
        {
            red();
            gotoxy(113 + x, 9);
            cout << lifeBar;
        }
        eragonchangeHealth = false;
    }
}
bool eragonLife()
{

    if (eragonHealth <= 0)
    {
        if (eragonLives > 0)
        {
            eragonHealth = eragonMaxHealth;
            eragonLives--;
        }
        else if (eragonLives == 0)
        {
            system("cls");
            eragonActive = false;
            printGameover();
            Sleep(3000);
            press();
        }
    }
}

bool eragonDeleteBullet(int x)
{

    eragonBulletX[x] = eragonBulletX[x + 1];
    eragonBulletY[x] = eragonBulletY[x + 1];
    eragonBulletCount--;
}

// Draco Functions

bool callDraco()
{
    dracoChangeHealth = true;
    dracoX = 80;
    dracoY = 3;
    dracoBulletCount = 0;
    dracoShotSpeed = 12;
    dracoSpeedLimit = 6;
    dracoHealth = 20;

    eraseDraco(dracoX, dracoY);
    dracoActive = true;
}
bool dracoMove()
{
    if (dracoSpeed % dracoSpeedLimit == 0)
    {
        if (dracoX > eragonX)
        {
            char nextLocation1 = getCharAtxy(dracoX - 1, dracoY);
            char nextLocation2 = getCharAtxy(dracoX - 1, dracoY + 1);
            char nextLocation3 = getCharAtxy(dracoX - 1, dracoY + 2);
            //  if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.' && nextLocation3 == ' ' || nextLocation3 == '.')

            if ((nextLocation1 == ' ' && nextLocation2 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond) || (nextLocation1 == heart || nextLocation2 == heart)))
            {
                moveLeftDraco();
            }
        }
        if (dracoX < eragonX)
        {
            char nextLocation1 = getCharAtxy(dracoX + 2, dracoY);
            char nextLocation2 = getCharAtxy(dracoX + 2, dracoY + 1);
            char nextLocation3 = getCharAtxy(dracoX + 2, dracoY + 2);
            // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.' && nextLocation3 == ' ' || nextLocation3 == '.')
            if ((nextLocation1 == ' ' && nextLocation2 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond) || (nextLocation1 == heart || nextLocation2 == heart)))
            {
                moveRightDraco();
            }
        }
        if (dracoY < eragonY)
        {
            char nextLocation1 = getCharAtxy(dracoX, dracoY + 3);
            char nextLocation2 = getCharAtxy(dracoX + 1, dracoY + 3);
            // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.')
            if ((nextLocation1 == ' ' && nextLocation2 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond) || (nextLocation1 == heart || nextLocation2 == heart)))
            {
                moveDownDraco();
            }
        }
        if (dracoY > eragonY)
        {
            char nextLocation1 = getCharAtxy(dracoX, dracoY - 1);
            char nextLocation2 = getCharAtxy(dracoX + 1, dracoY - 1);
            // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.')
            if ((nextLocation1 == ' ' && nextLocation2 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond) || (nextLocation1 == heart || nextLocation2 == heart)))
            {
                moveUpDraco();
            }
        }
    }
    dracoSpeed++;
}
bool moveLeftDraco()
{
    eraseDraco(dracoX, dracoY);
    dracoX = dracoX - 1;
    printDraco(dracoX, dracoY);
}
bool moveRightDraco()
{
    eraseDraco(dracoX, dracoY);
    dracoX = dracoX + 1;
    printDraco(dracoX, dracoY);
}
bool moveUpDraco()
{
    eraseDraco(dracoX, dracoY);
    dracoY = dracoY - 1;
    printDraco(dracoX, dracoY);
}
bool moveDownDraco()
{
    eraseDraco(dracoX, dracoY);
    dracoY = dracoY + 1;
    printDraco(dracoX, dracoY);
}

bool eraseDraco(int x, int y)
{

    for (int x = 0; x < 2; x++)
    {
        gotoxy(dracoX + x, dracoY);
        cout << " ";
    }

    for (int x = 0; x < 2; x++)
    {
        gotoxy(dracoX + x, dracoY + 1);
        cout << " ";
    }

    for (int x = 0; x < 2; x++)
    {
        gotoxy(dracoX + x, dracoY + 2);
        cout << " ";
    }
}
bool printDraco(int x, int y)
{
    lightYellow();
    char top = 148;
    char middle1 = 219, middle2 = 196;
    char bottom = 227;

    char draco[3][2] = { {' ', top},
                        {middle2, middle1},
                        {' ', bottom} };

    for (int x = 0; x < 3; x++)
    {
        gotoxy(dracoX, dracoY + x);
        for (int y = 0; y < 2; y++)
        {
            cout << draco[x][y];
        }
    }
}

bool dracoGenerateBullet()
{
    char next = getCharAtxy(dracoX - 1, dracoY + 1);

    if (next == ' ')
    {
        if (dracoShotCount % dracoShotSpeed == 0)
        {
            dracoBulletX[dracoBulletCount] = dracoX - 1;
            dracoBulletY[dracoBulletCount] = dracoY + 1;
            isActiveDraco[dracoBulletCount] = true;
            dracoBulletCount++;
            gotoxy(dracoX - 1, dracoY + 1);
            cout << ".";
        }
        dracoShotCount++;
    }
}
bool eraseDracoBullet(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printDracoBullet(int x, int y)
{
    lightYellow();
    gotoxy(x, y);
    cout << ".";
}
bool dracoMoveBullet()
{
    for (int x = 0; x < dracoBulletCount; x++)
    {
        if (isActiveDraco[x] == true)
        {
            char next = getCharAtxy(dracoBulletX[x] - 1, dracoBulletY[x]);
            if (next != ' ')
            {
                eraseDracoBullet(dracoBulletX[x], dracoBulletY[x]);
                isActiveDraco[x] = false;
            }
            else if (next == ' ')
            {
                eraseDracoBullet(dracoBulletX[x], dracoBulletY[x]);
                dracoBulletX[x] = dracoBulletX[x] - 1;
                printDracoBullet(dracoBulletX[x], dracoBulletY[x]);
            }
        }
    }
}

bool dracoCollision()
{
    for (int x = 0; x < eragonBulletCount; x++)
    {

        if (isActiveEragon[x] == true)
        {
            if (eragonBulletX[x] + 1 == dracoX && (eragonBulletY[x] == dracoY || eragonBulletY[x] == dracoY + 1 || eragonBulletY[x] == dracoY + 2))
            {
                dracoChangeHealth = true;
                eragonScore++;
                dracoHealth--;
            }
        }
    }
    for (int x = 0; x < eragonBulletCountL; x++)
    {
        if (isActiveEragonL[x] == true)
        {
            if (eragonBulletLX[x] - 2 == dracoX && (eragonBulletLY[x] == dracoY || eragonBulletLY[x] == dracoY + 1 || eragonBulletLY[x] == dracoY + 2))
            {
                dracoChangeHealth = true;
                eragonScore++;
                dracoHealth--;
            }
        }
    }
}
bool printDracoHealth()
{
    lightYellow();
    if (dracoChangeHealth == true)
    {
        gotoxy(113, 10);
        cout << "Draco Health is: ";
        for (int x = 0; x < dracoMaxHealth; x++)
        {
            grey();
            gotoxy(113 + x, 11);
            cout << lifeBar;
        }
        for (int x = 0; x < dracoHealth; x++)
        {
            red();
            gotoxy(113 + x, 11);
            cout << lifeBar;
        }
        dracoChangeHealth = false;
    }
}
bool deleteDraco()
{
    if (dracoHealth <= 0)
    {
        dracoHealth = 0;
        eraseDraco(dracoX, dracoY);
        dracoX = 0;
        dracoY = 35;
        dracoActive = false;
    }
}
//
//
///////////////////////////////////////////////
// Snape Functions
//////////////////////////////////////////////
//
//
bool callSnape()
{
    snapeChangeHealth = true;
    snapeX = 50;
    snapeY = 10;
    snapeBulletCount = 0;
    snapeShotCountR = 0;
    snapeShotSpeedR = 13;
    snapeShotCountL = 0;
    snapeShotSpeedL = 14;
    snapeHealth = 40;

    eraseSnape(snapeX, snapeY);
    snapeActive = true;
}
bool snapeMove()
{
    if (randomSnapeDelay % 15 == 0)
    {
        randomSnape = rand() % 4;
    }

    if (snapeSpeed % snapeSpeedLimit)
    {
        if (randomSnape == 0)
        {
            char nextLocation1 = getCharAtxy(snapeX - 1, snapeY);
            char nextLocation2 = getCharAtxy(snapeX - 1, snapeY + 1);
            char nextLocation3 = getCharAtxy(snapeX - 1, snapeY + 2);

            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveLeftSnape();
            }
        }
        if (randomSnape == 1)
        {
            char nextLocation1 = getCharAtxy(snapeX + 3, snapeY);
            char nextLocation2 = getCharAtxy(snapeX + 3, snapeY + 1);
            char nextLocation3 = getCharAtxy(snapeX + 3, snapeY + 2);
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveRightSnape();
            }
        }
        if (randomSnape == 2)
        {
            char nextLocation1 = getCharAtxy(snapeX, snapeY + 3);
            char nextLocation2 = getCharAtxy(snapeX + 1, snapeY + 3);
            char nextLocation3 = getCharAtxy(snapeX + 2, snapeY + 3);
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveDownSnape();
            }
        }
        if (randomSnape == 3)
        {
            char nextLocation1 = getCharAtxy(snapeX, snapeY - 1);
            char nextLocation2 = getCharAtxy(snapeX + 1, snapeY - 1);
            char nextLocation3 = getCharAtxy(snapeX + 2, snapeY - 1);
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveUpSnape();
            }
        }
    }
    snapeSpeed++;
    randomSnapeDelay++;
}
bool moveLeftSnape()
{
    eraseSnape(snapeX, snapeY);
    snapeX = snapeX - 1;
    printSnape(snapeX, snapeY);
}
bool moveRightSnape()
{
    eraseSnape(snapeX, snapeY);
    snapeX = snapeX + 1;
    printSnape(snapeX, snapeY);
}
bool moveUpSnape()
{
    eraseSnape(snapeX, snapeY);
    snapeY = snapeY - 1;
    printSnape(snapeX, snapeY);
}
bool moveDownSnape()
{
    eraseSnape(snapeX, snapeY);
    snapeY = snapeY + 1;
    printSnape(snapeX, snapeY);
}

bool eraseSnape(int x, int y)
{

    for (int x = 0; x < 3; x++)
    {
        gotoxy(snapeX, snapeY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << " ";
        }
    }
}
bool printSnape(int x, int y)
{
    lightBlue();
    char top = 149;
    char middle1 = 219, middle2 = 196;
    char bottom = 227;

    char snape[3][3] = { {' ', top, ' '},
                        {middle2, middle1, middle2},
                        {' ', bottom, ' '} };

    for (int x = 0; x < 3; x++)
    {
        gotoxy(snapeX, snapeY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << snape[x][y];
        }
    }
}

bool snapeGenerateBullet()
{
    char next = getCharAtxy(snapeX + 3, snapeY + 1);

    if (next == ' ')
    {
        if (snapeShotCountR % snapeShotSpeedR == 0)
        {
            snapeBulletX[snapeBulletCount] = snapeX + 3;
            snapeBulletY[snapeBulletCount] = snapeY + 1;
            isActiveSnape[snapeBulletCount] = true;
            snapeBulletCount++;
            gotoxy(snapeX + 3, snapeY + 1);
            cout << ",";
        }
        snapeShotCountR++;
    }
}
bool eraseSnapeBullet(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSnapeBullet(int x, int y)
{
    lightBlue();
    gotoxy(x, y);
    cout << ".";
}
bool snapeMoveBullet()
{
    for (int x = 0; x < snapeBulletCount; x++)
    {
        if (isActiveSnape[x] == true)
        {
            char next = getCharAtxy(snapeBulletX[x] + 1, snapeBulletY[x]);
            if (next != ' ')
            {
                eraseSnapeBullet(snapeBulletX[x], snapeBulletY[x]);
                isActiveSnape[x] = false;
            }
            else if (next == ' ')
            {
                eraseSnapeBullet(snapeBulletX[x], snapeBulletY[x]);
                snapeBulletX[x] = snapeBulletX[x] + 1;
                printSnapeBullet(snapeBulletX[x], snapeBulletY[x]);
            }
        }
    }
}

bool snapeGenerateBulletL()
{
    char next = getCharAtxy(snapeX - 1, snapeY + 1);

    if (next == ' ')
    {
        if (snapeShotCountL % snapeShotSpeedL == 0)
        {
            snapeBulletLX[snapeBulletCountL] = snapeX - 1;
            snapeBulletLY[snapeBulletCountL] = snapeY + 1;
            isActiveSnapeL[snapeBulletCountL] = true;
            snapeBulletCountL++;
            gotoxy(snapeX - 1, snapeY + 1);
            cout << ",";
        }
        snapeShotCountL++;
    }
}
bool eraseSnapeBulletL(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSnapeBulletL(int x, int y)
{
    lightBlue();
    gotoxy(x, y);
    cout << ".";
}
bool snapeMoveBulletL()
{
    for (int x = 0; x < snapeBulletCountL; x++)
    {
        if (isActiveSnapeL[x] == true)
        {
            char next = getCharAtxy(snapeBulletLX[x] - 1, snapeBulletLY[x]);
            if (next != ' ')
            {
                eraseSnapeBullet(snapeBulletLX[x], snapeBulletLY[x]);
                isActiveSnapeL[x] = false;
            }
            else if (next == ' ')
            {
                eraseSnapeBullet(snapeBulletLX[x], snapeBulletLY[x]);
                snapeBulletLX[x] = snapeBulletLX[x] - 1;
                printSnapeBulletL(snapeBulletLX[x], snapeBulletLY[x]);
            }
        }
    }
}

bool snapeCollision()
{
    for (int x = 0; x < eragonBulletCount; x++)
    {

        if (isActiveEragon[x] == true)
        {
            if (eragonBulletX[x] + 1 == snapeX && (eragonBulletY[x] == snapeY || eragonBulletY[x] == snapeY + 1 || eragonBulletY[x] == snapeY + 2))
            {
                snapeChangeHealth = true;
                eragonScore++;
                snapeHealth--;
            }
        }
    }
    for (int x = 0; x < eragonBulletCountL; x++)
    {
        if (isActiveEragonL[x] == true)
        {
            if (eragonBulletLX[x] - 3 == snapeX && (eragonBulletLY[x] == snapeY || eragonBulletLY[x] == snapeY + 1 || eragonBulletLY[x] == snapeY + 2))
            {
                snapeChangeHealth = true;
                eragonScore++;
                snapeHealth--;
            }
        }
    }
}
bool printSnapeHealth()
{
    lightBlue();

    if (snapeChangeHealth == true)
    {
        gotoxy(113, 12);
        cout << "Snape's Health is: " << snapeHealth << " ";
        for (int x = 0; x < snapeMaxHealth; x++)
        {
            if (snapeHealth < 20)
            {
                grey();
            }
            else if (snapeHealth > 20)
            {
                red();
            }
            gotoxy(113 + x, 13);
            cout << lifeBar;
        }
        if (snapeHealth < 20)
        {
            for (int x = 0; x < snapeHealth; x++)
            {
                red();
                gotoxy(113 + x, 13);
                cout << lifeBar;
            }
        }
        else if (snapeHealth > 20)
        {

            for (int x = 0; x < (snapeHealth - 20); x++)
            {
                green();
                gotoxy(113 + x, 13);
                cout << lifeBar;
            }
        }
        snapeChangeHealth = false;
    }
}
bool deleteSnape()
{
    if (snapeHealth <= 0)
    {
        snapeHealth = 0;
        eraseSnape(snapeX, snapeY);
        snapeX = 0;
        snapeY = 35;
        snapeActive = false;
    }
}
//
//
//////////////////////////////////////////////////////
// Sauron Functions
////////////////////////////////////////////////////////
//
//
bool callSauron()
{
    sauronChangeHealth = true;
    sauronX = 50;
    sauronY = 15;
    sauronBulletCount = 0;
    sauronShotCountR = 0;
    sauronShotSpeedR = 20;
    sauronShotCountL = 0;
    sauronShotSpeedL = 25;
    sauronHealth = 50;

    eraseSauron(sauronX, sauronY);
    sauronActive = true;
}
bool sauronMove()
{
    if (sauronSpeed % sauronSpeedLimitRightLeft == 0)
    {
        if (sauronX > eragonX)
        {
            char nextLocation1 = getCharAtxy(sauronX - 1, sauronY);
            char nextLocation2 = getCharAtxy(sauronX - 1, sauronY + 1);
            char nextLocation3 = getCharAtxy(sauronX - 1, sauronY + 2);

            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveLeftSauron();
            }
        }
        if (sauronX < eragonX)
        {
            char nextLocation1 = getCharAtxy(sauronX + 3, sauronY);
            char nextLocation2 = getCharAtxy(sauronX + 3, sauronY + 1);
            char nextLocation3 = getCharAtxy(sauronX + 3, sauronY + 2);
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveRightSauron();
            }
        }
    }

    if (sauronSpeed % sauronSpeedLimitUpDown == 0)
    {
        if (sauronY < eragonY)
        {
            char nextLocation1 = getCharAtxy(sauronX, sauronY + 3);
            char nextLocation2 = getCharAtxy(sauronX + 1, sauronY + 3);
            char nextLocation3 = getCharAtxy(sauronX + 2, sauronY + 3);
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveDownSauron();
            }
        }
        if (sauronY > eragonY)
        {
            char nextLocation1 = getCharAtxy(sauronX, sauronY - 1);
            char nextLocation2 = getCharAtxy(sauronX + 1, sauronY - 1);
            char nextLocation3 = getCharAtxy(sauronX + 2, sauronY - 1);
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveUpSauron();
            }
        }
    }
    sauronSpeed++;
}
bool moveLeftSauron()
{
    eraseSauron(sauronX, sauronY);
    sauronX = sauronX - 1;
    printSauron(sauronX, sauronY);
}
bool moveRightSauron()
{
    eraseSauron(sauronX, sauronY);
    sauronX = sauronX + 1;
    printSauron(sauronX, sauronY);
}
bool moveUpSauron()
{
    eraseSauron(sauronX, sauronY);
    sauronY = sauronY - 1;
    printSauron(sauronX, sauronY);
}
bool moveDownSauron()
{
    eraseSauron(sauronX, sauronY);
    sauronY = sauronY + 1;
    printSauron(sauronX, sauronY);
}

bool eraseSauron(int x, int y)
{

    for (int x = 0; x < 3; x++)
    {
        gotoxy(sauronX, sauronY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << " ";
        }
    }
}
bool printSauron(int x, int y)
{
    yellow();
    char top = 150;
    char middle1 = 219, middle2 = 196;
    char bottom = 227;

    char sauron[3][3] = { {' ', top, ' '},
                         {middle2, middle1, middle2},
                         {' ', bottom, ' '} };

    for (int x = 0; x < 3; x++)
    {
        gotoxy(sauronX, sauronY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << sauron[x][y];
        }
    }
}

bool sauronGenerateBullet()
{
    char next = getCharAtxy(sauronX + 3, sauronY + 1);

    if (next == ' ')
    {
        if (sauronShotCountR % sauronShotSpeedR == 0)
        {
            sauronBulletX[sauronBulletCount] = sauronX + 3;
            sauronBulletY[sauronBulletCount] = sauronY + 1;
            isActiveSauron[sauronBulletCount] = true;
            sauronBulletCount++;
            gotoxy(sauronX + 3, sauronY + 1);
            cout << ",";
        }
        sauronShotCountR++;
    }
}
bool eraseSauronBullet(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSauronBullet(int x, int y)
{
    yellow();
    gotoxy(x, y);
    cout << ".";
}
bool sauronMoveBullet()
{
    for (int x = 0; x < sauronBulletCount; x++)
    {
        if (isActiveSauron[x] == true)
        {
            char next;
            if (sauronBulletY[x] > eragonY)
            {
                next = getCharAtxy(sauronBulletX[x] + 1, sauronBulletY[x] - 1);
            }
            else if (sauronBulletY[x] < eragonY)
            {
                next = getCharAtxy(sauronBulletX[x] + 1, sauronBulletY[x] + 1);
            }
            else
            {
                next = getCharAtxy(sauronBulletX[x] + 1, sauronBulletY[x]);
            }

            if (next != ' ')
            {
                eraseSauronBullet(sauronBulletX[x], sauronBulletY[x]);
                isActiveSauron[x] = false;
            }
            else if (next == ' ')
            {
                eraseSauronBullet(sauronBulletX[x], sauronBulletY[x]);
                sauronBulletX[x] = sauronBulletX[x] + 1;
                if (sauronBulletY[x] > eragonY)
                {
                    sauronBulletY[x] = sauronBulletY[x] - 1;
                }
                if (sauronBulletY[x] < eragonY)
                {
                    sauronBulletY[x] = sauronBulletY[x] + 1;
                }
                printSauronBullet(sauronBulletX[x], sauronBulletY[x]);
            }
        }
    }
}

bool sauronGenerateBulletL()
{
    char next = getCharAtxy(sauronX - 1, sauronY + 1);

    if (next == ' ')
    {
        if (sauronShotCountL % sauronShotSpeedL == 0)
        {
            sauronBulletLX[sauronBulletCountL] = sauronX - 1;
            sauronBulletLY[sauronBulletCountL] = sauronY + 1;
            isActiveSauronL[sauronBulletCountL] = true;
            sauronBulletCountL++;
            gotoxy(sauronX - 1, sauronY + 1);
            cout << ",";
        }
        sauronShotCountL++;
    }
}
bool eraseSauronBulletL(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSauronBulletL(int x, int y)
{
    yellow();
    gotoxy(x, y);
    cout << ".";
}
bool sauronMoveBulletL()
{
    for (int x = 0; x < sauronBulletCountL; x++)
    {
        char next;
        if (isActiveSauronL[x] == true)
        {
            if (sauronBulletLY[x] > eragonY + 1)
            {
                next = getCharAtxy(sauronBulletLX[x] - 1, sauronBulletLY[x] - 1);
            }
            else if (sauronBulletLY[x] < eragonY + 1)
            {
                next = getCharAtxy(sauronBulletLX[x] - 1, sauronBulletLY[x] + 1);
            }
            else
            {
                next = getCharAtxy(sauronBulletLX[x] - 1, sauronBulletLY[x]);
            }
            if (next != ' ')
            {
                eraseSauronBullet(sauronBulletLX[x], sauronBulletLY[x]);
                isActiveSauronL[x] = false;
            }
            else if (next == ' ')
            {
                eraseSauronBulletL(sauronBulletLX[x], sauronBulletLY[x]);
                sauronBulletLX[x] = sauronBulletLX[x] - 1;
                if (sauronBulletLY[x] > eragonY + 1)
                {
                    sauronBulletLY[x] = sauronBulletLY[x] - 1;
                }
                else if (sauronBulletLY[x] < eragonY + 1)
                {
                    sauronBulletLY[x] = sauronBulletLY[x] + 1;
                }
                printSauronBulletL(sauronBulletLX[x], sauronBulletLY[x]);
            }
        }
    }
}

bool sauronCollision()
{
    for (int x = 0; x < eragonBulletCount; x++)
    {

        if (isActiveEragon[x] == true)
        {
            if (eragonBulletX[x] + 1 == sauronX && (eragonBulletY[x] == sauronY || eragonBulletY[x] == sauronY + 1 || eragonBulletY[x] == sauronY + 2))
            {
                sauronChangeHealth = true;
                eragonScore++;
                sauronHealth--;
            }
        }
    }
    for (int x = 0; x < eragonBulletCountL; x++)
    {
        if (isActiveEragonL[x] == true)
        {
            if (eragonBulletLX[x] - 3 == sauronX && (eragonBulletLY[x] == sauronY || eragonBulletLY[x] == sauronY + 1 || eragonBulletLY[x] == sauronY + 2))
            {
                sauronChangeHealth = true;
                eragonScore++;
                sauronHealth--;
            }
        }
    }
}
bool printSauronHealth()
{
    yellow();

    if (sauronChangeHealth == true)
    {
        gotoxy(113, 14);
        cout << "sauron's Health is: ";
        for (int x = 0; x < sauronMaxHealth; x++)
        {
            if (sauronHealth < 20)
            {
                grey();
            }
            else if (sauronHealth > 20 && sauronHealth < 40)
            {
                red();
            }
            else if (sauronHealth > 40)
            {
                green();
            }
            gotoxy(113 + x, 15);
            cout << lifeBar;
        }
        if (sauronHealth < 20)
        {
            for (int x = 0; x < sauronHealth; x++)
            {
                red();
                gotoxy(113 + x, 15);
                cout << lifeBar;
            }
        }
        else if (sauronHealth > 20 && sauronHealth < 40)
        {
            for (int x = 0; x < (sauronHealth - 20); x++)
            {
                green();
                gotoxy(113 + x, 15);
                cout << lifeBar;
            }
        }
        else if (sauronHealth > 40)
        {
            for (int x = 0; x < (sauronHealth - 40); x++)
            {
                pink();
                gotoxy(113 + x, 15);
                cout << lifeBar;
            }
        }
        sauronChangeHealth = false;
    }
}
bool deleteSauron()
{
    if (sauronHealth <= 0)
    {
        sauronHealth = 0;
        eraseSauron(sauronX, sauronY);
        sauronX = 0;
        sauronY = 35;
        sauronActive = false;
    }
}
//
//
/////////////////////////////////////////////////////////
// SeriusBlack Functions
/////////////////////////////////////////////////////////
//
//
bool callSeriusBlack()
{
    seriusBlackChangeHealth = true;
    seriusBlackX = 70;
    seriusBlackY = 15;
    seriusBlackBulletCount = 0;
    seriusBlackBulletCountL = 0;
    seriusBlackBulletCountF = 0;
    seriusBlackShotCountR = 0;
    seriusBlackShotSpeedR = 20;
    seriusBlackShotCountF = 0;
    seriusBlackShotSpeedF = 40;
    seriusBlackShotCountL = 0;
    seriusBlackShotSpeedL = 25;
    seriusBlackHealth = 60;

    eraseSeriusBlack(seriusBlackX, seriusBlackY);
    seriusBlackActive = true;
}
bool seriusBlackMove()
{
    if (seriusBlackSpeed % seriusBlackSpeedLimitUD == 0)
    {
        if (verticalDirectionSeriusBlack == "down")
        {
            char nextLocation1 = getCharAtxy(seriusBlackX, seriusBlackY + 3);
            char nextLocation2 = getCharAtxy(seriusBlackX + 1, seriusBlackY + 3);
            char nextLocation3 = getCharAtxy(seriusBlackX + 2, seriusBlackY + 3);
            // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.')
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveDownSeriusBlack();
            }
            else if (nextLocation1 != ' ' || nextLocation2 != ' ' || nextLocation3 != ' ')
            {
                if (seriusBlackX > eragonX)
                {
                    char nextLocation1 = getCharAtxy(seriusBlackX - 1, seriusBlackY);
                    char nextLocation2 = getCharAtxy(seriusBlackX - 1, seriusBlackY + 1);
                    char nextLocation3 = getCharAtxy(seriusBlackX - 1, seriusBlackY + 2);
                    //  if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.' && nextLocation3 == ' ' || nextLocation3 == '.')

                    if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
                    {
                        moveLeftSeriusBlack();
                    }
                }
                if (seriusBlackX < eragonX)
                {
                    char nextLocation1 = getCharAtxy(seriusBlackX + 3, seriusBlackY);
                    char nextLocation2 = getCharAtxy(seriusBlackX + 3, seriusBlackY + 1);
                    char nextLocation3 = getCharAtxy(seriusBlackX + 3, seriusBlackY + 2);
                    // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.' && nextLocation3 == ' ' || nextLocation3 == '.')
                    if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
                    {
                        moveRightSeriusBlack();
                    }
                }
                verticalDirectionSeriusBlack = "up";
            }
        }
        else if (verticalDirectionSeriusBlack == "up")
        {
            char nextLocation1 = getCharAtxy(seriusBlackX, seriusBlackY - 1);
            char nextLocation2 = getCharAtxy(seriusBlackX + 1, seriusBlackY - 1);
            char nextLocation3 = getCharAtxy(seriusBlackX + 2, seriusBlackY - 1);
            // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.')
            if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
            {
                moveUpSeriusBlack();
            }
            else if (nextLocation1 != ' ' || nextLocation2 != ' ' || nextLocation3 != ' ')
            {
                if (seriusBlackX > eragonX)
                {
                    char nextLocation1 = getCharAtxy(seriusBlackX - 1, seriusBlackY);
                    char nextLocation2 = getCharAtxy(seriusBlackX - 1, seriusBlackY + 1);
                    char nextLocation3 = getCharAtxy(seriusBlackX - 1, seriusBlackY + 2);
                    //  if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.' && nextLocation3 == ' ' || nextLocation3 == '.')

                    if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
                    {
                        moveLeftSeriusBlack();
                    }
                }
                if (seriusBlackX < eragonX)
                {
                    char nextLocation1 = getCharAtxy(seriusBlackX + 3, seriusBlackY);
                    char nextLocation2 = getCharAtxy(seriusBlackX + 3, seriusBlackY + 1);
                    char nextLocation3 = getCharAtxy(seriusBlackX + 3, seriusBlackY + 2);
                    // if (nextLocation1 == ' ' || nextLocation1 == '.' && nextLocation2 == ' ' || nextLocation2 == '.' && nextLocation3 == ' ' || nextLocation3 == '.')
                    if ((nextLocation1 == ' ' && nextLocation2 == ' ' && nextLocation3 == ' ') || ((nextLocation1 == diamond || nextLocation2 == diamond || nextLocation3 == diamond) || (nextLocation1 == heart || nextLocation2 == heart || nextLocation3 == heart)))
                    {
                        moveRightSeriusBlack();
                    }
                }
                verticalDirectionSeriusBlack = "down";
            }
        }
    }
    seriusBlackSpeed++;
}
bool moveLeftSeriusBlack()
{
    eraseSeriusBlack(seriusBlackX, seriusBlackY);
    seriusBlackX = seriusBlackX - 1;
    printSeriusBlack(seriusBlackX, seriusBlackY);
}
bool moveRightSeriusBlack()
{
    eraseSeriusBlack(seriusBlackX, seriusBlackY);
    seriusBlackX = seriusBlackX + 1;
    printSeriusBlack(seriusBlackX, seriusBlackY);
}
bool moveUpSeriusBlack()
{
    eraseSeriusBlack(seriusBlackX, seriusBlackY);
    seriusBlackY = seriusBlackY - 1;
    printSeriusBlack(seriusBlackX, seriusBlackY);
}
bool moveDownSeriusBlack()
{
    eraseSeriusBlack(seriusBlackX, seriusBlackY);
    seriusBlackY = seriusBlackY + 1;
    printSeriusBlack(seriusBlackX, seriusBlackY);
}

bool eraseSeriusBlack(int x, int y)
{

    for (int x = 0; x < 3; x++)
    {
        gotoxy(seriusBlackX, seriusBlackY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << " ";
        }
    }
}
bool printSeriusBlack(int x, int y)
{
    lightRed();
    char top = 151;
    char middle1 = 219, middle2 = 196;
    char bottom = 227;

    char seriusBlack[3][3] = { {' ', top, ' '},
                              {middle2, middle1, middle2},
                              {'/', bottom, '\\'} };

    for (int x = 0; x < 3; x++)
    {
        gotoxy(seriusBlackX, seriusBlackY + x);
        for (int y = 0; y < 3; y++)
        {
            cout << seriusBlack[x][y];
        }
    }
}

bool seriusBlackGenerateBullet()
{
    char next = getCharAtxy(seriusBlackX + 3, seriusBlackY + 1);

    if (next == ' ')
    {
        if (seriusBlackShotCountR % seriusBlackShotSpeedR == 0)
        {
            seriusBlackBulletX[seriusBlackBulletCount] = seriusBlackX + 3;
            seriusBlackBulletY[seriusBlackBulletCount] = seriusBlackY + 1;
            isActiveSeriusBlack[seriusBlackBulletCount] = true;
            seriusBlackBulletCount++;
            gotoxy(seriusBlackX + 3, seriusBlackY + 1);
            cout << "*";
        }
        seriusBlackShotCountR++;
    }
}
bool eraseSeriusBlackBullet(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSeriusBlackBullet(int x, int y)
{
    lightRed();
    gotoxy(x, y);
    cout << ".";
}
bool seriusBlackMoveBullet()
{
    if (seriusBlackBulletRSpeed % seriusBlackBulletRSpeedLimit == 0)
    {
        for (int x = 0; x < seriusBlackBulletCount; x++)
        {
            if (isActiveSeriusBlack[x] == true)
            {
                char next;
                if (seriusBlackBulletY[x] > eragonY)
                {
                    next = getCharAtxy(seriusBlackBulletX[x] + 1, seriusBlackBulletY[x] - 1);
                }
                else if (seriusBlackBulletY[x] < eragonY)
                {
                    next = getCharAtxy(seriusBlackBulletX[x] + 1, seriusBlackBulletY[x] + 1);
                }
                else
                {
                    next = getCharAtxy(seriusBlackBulletX[x] + 1, seriusBlackBulletY[x]);
                }

                if (next != ' ')
                {
                    eraseSeriusBlackBullet(seriusBlackBulletX[x], seriusBlackBulletY[x]);
                    isActiveSeriusBlack[x] = false;
                }
                else if (next == ' ')
                {
                    eraseSeriusBlackBullet(seriusBlackBulletX[x], seriusBlackBulletY[x]);
                    seriusBlackBulletX[x] = seriusBlackBulletX[x] + 1;
                    if (seriusBlackBulletY[x] > eragonY)
                    {
                        seriusBlackBulletY[x] = seriusBlackBulletY[x] - 1;
                    }
                    if (seriusBlackBulletY[x] < eragonY)
                    {
                        seriusBlackBulletY[x] = seriusBlackBulletY[x] + 1;
                    }
                    printSeriusBlackBullet(seriusBlackBulletX[x], seriusBlackBulletY[x]);
                }
            }
        }
    }
    seriusBlackBulletRSpeed++;
}

bool seriusBlackGenerateBulletL()
{
    char next = getCharAtxy(seriusBlackX - 1, seriusBlackY + 1);

    if (next == ' ')
    {
        if (seriusBlackShotCountL % seriusBlackShotSpeedL == 0)
        {
            seriusBlackBulletLX[seriusBlackBulletCountL] = seriusBlackX - 1;
            seriusBlackBulletLY[seriusBlackBulletCountL] = seriusBlackY + 1;
            isActiveSeriusBlackL[seriusBlackBulletCountL] = true;
            seriusBlackBulletCountL++;
            gotoxy(seriusBlackX - 1, seriusBlackY + 1);
            cout << ",";
        }
        seriusBlackShotCountL++;
    }
}
bool eraseSeriusBlackBulletL(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSeriusBlackBulletL(int x, int y)
{
    lightRed();
    gotoxy(x, y);
    cout << ".";
}
bool seriusBlackMoveBulletL()
{
    if (seriusBlackBulletLSpeed % seriusBlackBulletLSpeedLimit == 0)
    {
        for (int x = 0; x < seriusBlackBulletCountL; x++)
        {
            char next;
            if (isActiveSeriusBlackL[x] == true)
            {
                if (seriusBlackBulletLY[x] > eragonY + 1)
                {
                    next = getCharAtxy(seriusBlackBulletLX[x] - 1, seriusBlackBulletLY[x] - 1);
                }
                else if (seriusBlackBulletLY[x] < eragonY + 1)
                {
                    next = getCharAtxy(seriusBlackBulletLX[x] - 1, seriusBlackBulletLY[x] + 1);
                }
                else
                {
                    next = getCharAtxy(seriusBlackBulletLX[x] - 1, seriusBlackBulletLY[x]);
                }
                if (next != ' ')
                {
                    eraseSeriusBlackBulletL(seriusBlackBulletLX[x], seriusBlackBulletLY[x]);
                    isActiveSeriusBlackL[x] = false;
                }
                else if (next == ' ')
                {
                    eraseSeriusBlackBulletL(seriusBlackBulletLX[x], seriusBlackBulletLY[x]);
                    seriusBlackBulletLX[x] = seriusBlackBulletLX[x] - 1;
                    if (seriusBlackBulletLY[x] > eragonY + 1)
                    {
                        seriusBlackBulletLY[x] = seriusBlackBulletLY[x] - 1;
                    }
                    else if (seriusBlackBulletLY[x] < eragonY + 1)
                    {
                        seriusBlackBulletLY[x] = seriusBlackBulletLY[x] + 1;
                    }
                    printSeriusBlackBulletL(seriusBlackBulletLX[x], seriusBlackBulletLY[x]);
                }
            }
        }
    }
    seriusBlackBulletLSpeed++;
}

bool seriusBlackGenerateBulletFollow()
{
    char next = getCharAtxy(seriusBlackX + 1, seriusBlackY - 2);
    if (next == ' ')
    {
        if (seriusBlackShotCountF % seriusBlackShotSpeedF == 0)
        {
            seriusBlackBulletFX[seriusBlackBulletCountF] = seriusBlackX + 1;
            seriusBlackBulletFY[seriusBlackBulletCountF] = seriusBlackY - 2;
            isActiveSeriusBlackF[seriusBlackBulletCountF] = true;
            seriusBlackBulletCountF++;
            gotoxy(seriusBlackX + 1, seriusBlackY - 2);
            cout << "*";
        }
        seriusBlackShotCountF++;
    }
}
bool eraseSeriusBlackBulletFollow(int x, int y)
{
    gotoxy(x, y);
    cout << " ";
}
bool printSeriusBlackBulletFollow(int x, int y)
{
    pink();
    gotoxy(x, y);
    cout << "*";
}
bool seriusBlackMoveBulletFollow()
{
    if (seriusBlackBulletFSpeed % seriusBlackBulletFSpeedLimit == 0)
    {
        for (int x = 0; x < seriusBlackBulletCountF; x++)
        {

            char next;
            if (isActiveSeriusBlackF[x] == true)
            {
                if (seriusBlackBulletFX[x] >= eragonX + 1)
                {
                    if (seriusBlackBulletFY[x] > eragonY + 1)
                    {
                        next = getCharAtxy(seriusBlackBulletFX[x] - 1, seriusBlackBulletFY[x] - 1);
                    }
                    else if (seriusBlackBulletFY[x] < eragonY + 1)
                    {
                        next = getCharAtxy(seriusBlackBulletFX[x] - 1, seriusBlackBulletFY[x] + 1);
                    }
                    else
                    {
                        next = getCharAtxy(seriusBlackBulletFX[x] - 1, seriusBlackBulletFY[x]);
                    }
                }
                if (seriusBlackBulletFX[x] < eragonX + 1)
                {
                    if (seriusBlackBulletFY[x] > eragonY + 1)
                    {
                        next = getCharAtxy(seriusBlackBulletFX[x] + 1, seriusBlackBulletFY[x] - 1);
                    }
                    else if (seriusBlackBulletFY[x] < eragonY + 1)
                    {
                        next = getCharAtxy(seriusBlackBulletFX[x] + 1, seriusBlackBulletFY[x] + 1);
                    }
                    else
                    {
                        next = getCharAtxy(seriusBlackBulletFX[x] + 1, seriusBlackBulletFY[x]);
                    }
                }
                if (next != ' ')
                {
                    eraseSeriusBlackBulletFollow(seriusBlackBulletFX[x], seriusBlackBulletFY[x]);
                    isActiveSeriusBlackF[x] = false;
                }
                else if (next == ' ')
                {
                    eraseSeriusBlackBulletFollow(seriusBlackBulletFX[x], seriusBlackBulletFY[x]);
                    if (seriusBlackBulletFX[x] >= eragonX + 1)
                    {
                        seriusBlackBulletFX[x] = seriusBlackBulletFX[x] - 1;
                        if (seriusBlackBulletFY[x] > eragonY + 1)
                        {
                            seriusBlackBulletFY[x] = seriusBlackBulletFY[x] - 1;
                        }
                        else if (seriusBlackBulletFY[x] < eragonY + 1)
                        {
                            seriusBlackBulletFY[x] = seriusBlackBulletFY[x] + 1;
                        }
                    }
                    if (seriusBlackBulletFX[x] < eragonX + 1)
                    {
                        seriusBlackBulletFX[x] = seriusBlackBulletFX[x] + 1;
                        if (seriusBlackBulletFY[x] > eragonY + 1)
                        {
                            seriusBlackBulletFY[x] = seriusBlackBulletFY[x] - 1;
                        }
                        else if (seriusBlackBulletFY[x] < eragonY + 1)
                        {
                            seriusBlackBulletFY[x] = seriusBlackBulletFY[x] + 1;
                        }
                    }
                    printSeriusBlackBulletFollow(seriusBlackBulletFX[x], seriusBlackBulletFY[x]);
                }
            }
        }
    }
    seriusBlackBulletFSpeed++;
}

bool seriusBlackCollision()
{
    for (int x = 0; x < eragonBulletCount; x++)
    {

        if (isActiveEragon[x] == true)
        {
            if (eragonBulletX[x] + 1 == seriusBlackX && (eragonBulletY[x] == seriusBlackY || eragonBulletY[x] == seriusBlackY + 1 || eragonBulletY[x] == seriusBlackY + 2))
            {
                seriusBlackChangeHealth = true;
                eragonScore++;
                seriusBlackHealth--;
            }
        }
    }
    for (int x = 0; x < eragonBulletCountL; x++)
    {
        if (isActiveEragonL[x] == true)
        {
            if (eragonBulletLX[x] - 3 == seriusBlackX && (eragonBulletLY[x] == seriusBlackY || eragonBulletLY[x] == seriusBlackY + 1 || eragonBulletLY[x] == seriusBlackY + 2))
            {
                seriusBlackChangeHealth = true;
                eragonScore++;
                seriusBlackHealth--;
            }
        }
    }
}
bool printSeriusBlackHealth()
{
    lightRed();

    if (seriusBlackChangeHealth == true)
    {
        gotoxy(113, 16);
        cout << "seriusBlack's Health is: ";
        for (int x = 0; x < seriusBlackMaxHealth; x++)
        {
            if (seriusBlackHealth < 20)
            {
                grey();
            }
            else if (seriusBlackHealth > 20 && seriusBlackHealth < 40)
            {
                red();
            }
            else if (seriusBlackHealth > 40)
            {
                green();
            }
            gotoxy(113 + x, 17);
            cout << lifeBar;
        }
        if (seriusBlackHealth < 20)
        {
            for (int x = 0; x < seriusBlackHealth; x++)
            {
                red();
                gotoxy(113 + x, 17);
                cout << lifeBar;
            }
        }
        else if (seriusBlackHealth > 20 && seriusBlackHealth < 40)
        {
            for (int x = 0; x < (seriusBlackHealth - 20); x++)
            {
                green();
                gotoxy(113 + x, 17);
                cout << lifeBar;
            }
        }
        else if (seriusBlackHealth > 40)
        {
            for (int x = 0; x < (seriusBlackHealth - 40); x++)
            {
                pink();
                gotoxy(113 + x, 17);
                cout << lifeBar;
            }
        }
        seriusBlackChangeHealth = false;
    }
}
bool deleteSeriusBlack()
{
    if (seriusBlackHealth <= 0)
    {
        seriusBlackHealth = 0;
        eraseSeriusBlack(seriusBlackX, seriusBlackY);
        seriusBlackX = 0;
        seriusBlackY = 35;
        seriusBlackActive = false;
    }
}
//
//
/////////////////////////////////////
// Load Store Functions
/////////////////////////////////////
//
//
string getField(string record, int field)
{
    int commaCount = 1;
    string item;
    for (int x = 0; x < record.length(); x++)
    {
        if (record[x] == ',')
        {
            commaCount = commaCount + 1;
        }
        else if (commaCount == field)
        {
            item = item + record[x];
        }
    }
    return item;
}
bool storeCharacterData()
{
    fstream file;
    file.open("CharacterData.txt", ios::out);

    file << eragonX << ","
        << eragonY << ","
        << eragonHealth << ","
        << eragonScore << ","
        << eragonLives << ","
        << dracoX << ","
        << dracoY << ","
        << dracoHealth << ","
        << dracoActive << ","
        << snapeX << ","
        << snapeY << ","
        << snapeHealth << ","
        << snapeActive << ","
        << randomSnape << ","
        << sauronX << ","
        << sauronY << ","
        << sauronHealth << ","
        << sauronActive << ","
        << seriusBlackX << ","
        << seriusBlackY << ","
        << seriusBlackHealth << ","
        << seriusBlackActive << ","
        << verticalDirectionSeriusBlack << ","
        << eragonScore << ","
        << level;

    file.close();
}
bool loadCharacterData()
{
    string dracoActive_, snapeActive_, sauronActive_, seriusBlackActive_;

    string record;
    fstream data;
    data.open("CharacterData.txt", ios::in);

    getline(data, record);

    eragonX = stoi(getField(record, 1));
    eragonY = stoi(getField(record, 2));
    eragonHealth = stoi(getField(record, 3));
    eragonScore = stoi(getField(record, 4));
    eragonLives = stoi(getField(record, 5));
    dracoX = stoi(getField(record, 6));
    dracoY = stoi(getField(record, 7));
    dracoHealth = stoi(getField(record, 8));
    dracoActive_ = getField(record, 9);
    snapeX = stoi(getField(record, 10));
    snapeY = stoi(getField(record, 11));
    snapeHealth = stoi(getField(record, 12));
    snapeActive_ = getField(record, 13);
    randomSnape = stoi(getField(record, 14));
    sauronX = stoi(getField(record, 15));
    sauronY = stoi(getField(record, 16));
    sauronHealth = stoi(getField(record, 17));
    sauronActive_ = getField(record, 18);
    seriusBlackX = stoi(getField(record, 19));
    seriusBlackY = stoi(getField(record, 20));
    seriusBlackHealth = stoi(getField(record, 21));
    seriusBlackActive_ = getField(record, 22);
    verticalDirectionSeriusBlack = getField(record, 23);
    eragonScore = stoi(getField(record, 24));
    level = stoi(getField(record, 25));

    loadCharacterHelper(dracoActive_, snapeActive_, sauronActive_, seriusBlackActive_);
}
bool loadCharacterHelper(string dracoActive_, string snapeActive_, string sauronActive_, string seriusBlackActive_)
{
    if (dracoActive_ == "1")
    {
        dracoActive = true;
    }
    else if (dracoActive_ == "0")
    {
        dracoActive_ = false;
    }
    if (snapeActive_ == "1")
    {
        snapeActive = true;
    }
    else if (snapeActive_ == "0")
    {
        snapeActive = false;
    }
    if (sauronActive_ == "1")
    {
        sauronActive = true;
    }
    else if (sauronActive_ == "0")
    {
        sauronActive = false;
    }
    if (seriusBlackActive_ == "1")
    {
        seriusBlackActive = true;
    }
    else if (seriusBlackActive_ == "0")
    {
        seriusBlackActive = false;
    }
}

bool press()
{
    cout << endl;
    cout << "Press any key to continue" << endl;
    //getch();
}
