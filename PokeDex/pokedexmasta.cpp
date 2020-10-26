#include<stdio.h>
#include<time.h>
#include<windows.h>
#include<conio.h>
#include<string.h>

FILE *dexread;

char map[17][37]={
		"####################################",
		"#   vvvvvvvvvvvvvv    vvvvv   vvvvv#",
		"#vvvvv    vvvvvvvvvvv  vvv   vvvvvv#",
		"#vvvvvv      vvvvvvvvv  v   vvvvvvv#",
		"#vvvvvvvv   vvvvvvvvvvvvvvvvvvvvvvv#",
		"#vvvvvvvvvvvvv vvvvvvvvvvvvvvvvvv  #",
		"#vvvvvvv vvvvv    vvvvvv  vvvvvv   #",
		"#vvvvvvv  vvv   SSSS   vvvvvvvvv   #",
		"#vv  vvvvvvvvvv S##S  vvvvvvvvv   v#",
		"#vv  vvvvvvvvvv SSSS  vvvvvvvv   vv#",
		"#vv   vvvv  vvvvvvvvvvvv  vvvv   vv#",
		"#vvv   vvvv vvvvvvvvv   vvvvvv   vv#",
		"#vvvvv vvvvvvvvvvvvvvvvvv       vvv#",
		"#vvvvvv vvvvvvvvvvvvvvvv  vvvv  vvv#",
		"#vvvvvvv vvvvvvvvvvvvvv  vvvv  vvvv#",
		"####################################"
};
char name[16]={0};

int xPos=1,yPos=1;

char pIcon = '\xf';

struct playerdex{
	char pokename[100],poketype[100],pokecate[100];
	int no,pokecount;
	int money,poke,greatpoke,ultrapoke,masterpoke;
};

playerdex pdexdata[31]={0};
playerdex pdexsort[31]={0};

void pdexdefault(){
	pdexdata[0].money = 1000;
	pdexdata[0].poke = 10;
	pdexdata[0].greatpoke = 5;
	pdexdata[0].ultrapoke = 3;
	pdexdata[0].masterpoke = 0;
	for (int a =1 ; a<31;a++){
		pdexdata[a].no =a;
		strcpy(pdexdata[a].pokename ,"?????");
		strcpy(pdexdata[a].poketype, "???" );
		strcpy(pdexdata[a].pokecate ,"?????");
		pdexdata[a].pokecount = 0;
	}
}


struct pokedex{
	char pokename[100],poketype[100],pokecate[100];
	int no,pokecount;
};

pokedex dexdata[31]={0};

void dexreader(){
	int a=0;
	int x;
	dexread = fopen("pokedex.txt","r");
	if (dexread){
		while (!feof(dexread)){
			fscanf(dexread,"%[^#]#%[^#]#%d#%[^\n]\n",&dexdata[a].pokename,&dexdata[a].poketype,&dexdata[a].pokecount ,&dexdata[a].pokecate);
			dexdata[a].no =a+1;
			x=strlen(dexdata[a].poketype );
			for (int i = 0 ; i< x;i++){
				if (dexdata[a].poketype[i] == '$'){
					dexdata[a].poketype[i] = '-';
				}
			}
			a++;
		}
	}
}

int shopsortdefault(){
	int b=1;
	for (int a =1 ; a<31;a++){
		if ( strcmp (pdexdata[a].pokename,"?????")){
			strcpy(pdexsort[b].pokename ,pdexdata[a].pokename );
			pdexsort[b].pokecount = pdexdata[a].pokecount ;
			b++;
		}
	}
	return b;
}


void createmap(){
	int x=strlen(name);
	printf("%s\n",name);
	for (int a=0;a<x;a++){
		printf("=");
	}printf("\n\n\n");
	for (int a=0;a<16;a++){
		for (int b= 0 ; b<36;b++){
			printf("%c",map[a][b]);
		}
		printf("\n");
	}
	printf("press 'h' for open help menu\n");
}

void cls(){
	for(int a = 0 ; a<30;a++)
	printf("\n");
}

void savegame(){
	int x;
	bool flag = false;
	for(int a=1;a<31;a++){
		x= strlen(pdexdata[a].poketype);
		for(int b=1;b<x;b++){
			if(pdexdata[a].poketype[b]=='-'){
				pdexdata[a].poketype[b]='$';
				flag = true;
				break;
			}	
			if (!flag){
			 pdexdata[a].poketype[x] = '$'; 
			}
		}

	}
	for(int a=1;a<31;a++){
		if(pdexdata[a].poketype=="???"){
			pdexdata[a].poketype[3]='$';
		}
	}
	char createfile[20];
	strcpy(createfile,name);
	strcat(createfile,".txt");
	FILE *create;
	create=fopen(createfile,"w");
	
	fprintf(create,"%d#%d#%d#%d#%d\n",pdexdata[0].money,pdexdata[0].poke ,pdexdata[0].greatpoke ,pdexdata[0].ultrapoke ,pdexdata[0].masterpoke );
	for(int a=1;a<31;a++){
		fprintf(create,"%s#%s#%d#%s\n",pdexdata[a].pokename ,pdexdata[a].poketype ,pdexdata[a].pokecount ,pdexdata[a].pokecate );
	}
	fclose(create);
}


void help(){
	cls();
	printf("Key Information\n");
	printf("===============\n");
	printf("To move use key [w|a|s|d]\n");
	printf("To open your pokedex use key [p]\n");
	printf("To open your character information use key [c]\n");
	printf("To exit and save the game use key [x]\n\n\n\n");
	printf("Map Information\n===============\n");
	printf("grass [v] is where you can find pokemon, item, or money\n");
	printf("shop [S] is where you can open shop menu to sell or buy item\n\n\n\n\n");
	printf("Press enter to continue..");getchar();
}

void validateAlphaNumeric(){
	int x;
	int isalp=0,isnum=0;
	do{
		printf("My name is [5..15][alpha numeric]: ");
		scanf("%[^\n]",&name); getchar();
		x= strlen(name);
		for (int a=0;a<x;a++){
			if (isalpha(name[a])){
				isalp =1;
			}
			if (isdigit(name[a])){
				isnum =1;
			}
		}
	}while(isalp == 0 || isnum==0 || x < 5 || x>15);
}

int openpdex()
{
	cls();
	printf("Pokedex\n");
	printf("=======\n");
	for(int i=0;i<71;i++)	printf("=");
	printf("\n");
	printf("| No |      Name      |        Type        | Count |     Category     |\n");
	for(int i=0;i<71;i++)	printf("=");
	printf("\n");
	for(int i=1;i<31;i++){
		printf("| %-2d | %-14s | %-18s | %-5d | %-16s |\n",pdexdata[i].no ,pdexdata[i].pokename ,pdexdata[i].poketype,pdexdata[i].pokecount,pdexdata[i].pokecate);
	}
	for(int i=0;i<71;i++)	printf("=");
	printf("\n");
	printf("Press enter to continue...");getchar();
}

void pdexchange(int pokemon){
	strcpy(pdexdata[pokemon].pokename ,dexdata[pokemon].pokename );
	strcpy(pdexdata[pokemon].poketype ,dexdata[pokemon].poketype );
	strcpy(pdexdata[pokemon].pokecate , dexdata[pokemon].pokecate );
	pdexdata[pokemon].pokecount ++;
}

void meetpokemon(){
	int pokemon = (rand()%29) +1;
	int x;
	int choice;
	int chance;
	bool flag = false;
	cls();
	printf("You have encountered a wild legendary pokemon!\n");
	printf("Press enter to continue...");getchar(); 
	cls();
	printf("Wild %s has appeared!",dexdata[pokemon].pokename ); getchar();
	do{
		cls();
		printf("%s\n",dexdata[pokemon].pokename);
		x = strlen(dexdata[pokemon].pokename);
		for(int i=0;i<x;i++){
			printf("=");
		}
		printf("\n");
		printf("What will you do ?\n");
		printf("1. Use Pokeball (%d left)\n",pdexdata[0].poke);
		printf("2. Use Greatball (%d left)\n",pdexdata[0].greatpoke );
		printf("3. Use Ultraball (%d left)\n",pdexdata[0].ultrapoke );
		printf("4. Use Masterball (%d left)\n",pdexdata[0].masterpoke );
		printf("5. Flee\n");
		do{
			printf("Choose [1..5] :");scanf("%d",&choice);getchar();
		}while(choice<1||choice>5);
		switch(choice){
			case 1:{
				if (pdexdata[0].poke>0){
					pdexdata[0].poke--;
					printf("Throwing a Pokeball !\n");
					for (int a=1;a<=3;a++){
						chance = (rand()%10);
						Sleep(800);
						printf("...! ");
						Sleep(800);
						if (chance == 4){
							printf("You have caught %s\n",dexdata[pokemon].pokename);
							printf("Press enter to continue..."); getchar();
							pdexchange(pokemon);
							flag = true;
							break;
						}	
					}
					if (flag == false){
						printf("The pokemon broke away\n");
						printf("Press enter to continue..."); getchar();
						int x=rand()%5;
						if(x==1){
							printf("%s has fled!\n",dexdata[pokemon].pokename);
							flag= true;
						}
								}
							} else printf("You don't have any Pokeball!"); getchar();
				break;
			}
			case 2:{
				if (pdexdata[0].greatpoke >0){
					pdexdata[0].greatpoke--;
					printf("Throwing a Pokeball !\n");
					for (int a=1;a<=3;a++){
						chance = (rand()%10);
						Sleep(800);
						printf("...! ");
						Sleep(800);
						if (chance == 4 || chance == 7){
							printf("You have caught %s\n",dexdata[pokemon].pokename);
							printf("Press enter to continue..."); getchar();
							pdexchange(pokemon);
							flag = true;
							break;
						}	
					}
					if (flag == false){
						printf("The pokemon broke away\n");
						printf("Press enter to continue..."); getchar();
						int x=rand()%5;
						if(x==2){
							printf("%s has fled!\n",dexdata[pokemon].pokename);
							flag= true;
						}
								}
							} else printf("You don't have any Greatball!"); getchar();
				break;
			}
			case 3:{
				if (pdexdata[0].ultrapoke  >0){
					pdexdata[0].ultrapoke --;
					printf("Throwing a Pokeball !\n");
					for (int a=1;a<=3;a++){
						chance = (rand()%10);
						Sleep(800);
						printf("...! ");
						Sleep(800);
						if (chance == 4 || chance == 7 || chance == 1 || chance == 2 || chance == 9){
							printf("You have caught %s\n",dexdata[pokemon].pokename);
							printf("Press enter to continue..."); getchar();
							pdexchange(pokemon);
							flag = true;
							break;
						}	
					}
					if (flag == false){
						printf("The pokemon broke away\n");
						printf("Press enter to continue..."); getchar();
						int x=rand()%5;
						if(x==2){
							printf("%s has fled!\n",dexdata[pokemon].pokename);getchar();
							flag= true;
						}
								}
							} else printf("You don't have any Ultraball!"); getchar();
				break;
			}
			case 4:{
				if (pdexdata[0].masterpoke   >0){
					pdexdata[0].masterpoke  --;
					printf("Throwing a Pokeball !\n");
					Sleep(800);
					printf("...! ");
					Sleep(800);
					printf("You have caught %s\n",dexdata[pokemon].pokename);
					printf("Press enter to continue...");getchar();
					pdexchange(pokemon);
					flag = true;
				}
				else printf("You don't have any Masterball!"); getchar();
				break;
			}
			case 5:{
				flag=true;
				printf("You have escaped from %s",dexdata[pokemon].pokename); getchar();
				break;
			}
		}
	} while(!flag);
}

void grass(int chance){
	int money;
	if (chance >= 60 && chance <70){
		cls();
		money = (rand()%51) +50;
		printf("You have got %d money(s) !\n",money);
		pdexdata[0].money += money;
		printf("You have %d money(s) now!\n",pdexdata[0].money);
		printf("Press enter to continue...");getchar();
	}
	else
	if(chance >= 10 && chance <19){
		cls();
		pdexdata[0].poke++;
		printf("You have found a Pokeball !\n");
		printf("You have %d Pokeball(s) now!\n",pdexdata[0].poke);
		printf("Press enter to continue...");getchar();
	} else 
	if(chance >= 25 && chance < 30){
		cls();
		pdexdata[0].greatpoke++;
		printf("You have found a Greatball !\n");
		printf("You have %d Greatball(s) now!\n",pdexdata[0].greatpoke);
		printf("Press enter to continue...");getchar();	
	} else
	if(chance == 50){
		cls();
		pdexdata[0].ultrapoke++;
		printf("You have found a Ultraball !\n");
		printf("You have %d Ultraball(s) now!\n",pdexdata[0].ultrapoke);
		printf("Press enter to continue...");getchar();
	}
	else
	if (chance >= 40 && chance <45){
		meetpokemon();
	}
}

void pinfo(){
	int found=0;
	cls();
	for(int a=0;a<28;a++){
		printf("=");
	}
	printf("\n");
	printf(" |%15s's Info |\n",name);
	for(int a=0;a<28;a++){
		printf("=");
	}
	printf("\n");
	for(int a=1;a<31;a++){
		if(strcmp(pdexdata[a].pokename ,"?????")){
			found++;
		}
	}
	
	printf("Money      : %d\n",pdexdata[0].money );
	printf("Pokedex    : %d\n",found);
	printf("Pokeball   : %d\n",pdexdata[0].poke );
	printf("Greatball  : %d\n",pdexdata[0].greatpoke );
	printf("Ultraball  : %d\n",pdexdata[0].ultrapoke );
	printf("Masterball : %d\n\n\n",pdexdata[0].masterpoke );
	printf("Press enter to continue...");getchar();
}

void buypoke(){
	int choice;
	int buy;
	do{
		do{
			cls();
			printf("Buy Pokeballs\n");
			printf("=============\n");
			printf("Money: %d\n",pdexdata[0].money );
			printf("=============\n");
			printf("1. Pokeball   | 500  | You have: %d\n",pdexdata[0].poke );
			printf("2. Greatball  | 1000 | You have: %d\n",pdexdata[0].greatpoke );
			printf("3. Ultraball  | 2000 | You have: %d\n",pdexdata[0].ultrapoke );
			printf("4. Masterball | 9999 | You have: %d\n",pdexdata[0].masterpoke );
			printf("5. Exit\n");
			printf("Choose [1..5]: ");scanf("%d",&choice);getchar();
			switch (choice){
				case 1:{
					printf("How many do you want to buy ? ");scanf("%d",&buy);getchar();
					if (pdexdata[0].money >= buy*500){
						pdexdata[0].money -=(buy*500);
						pdexdata[0].poke += buy;
						printf("Thanks for buying!"); getchar();
					} else{
						printf("You don't have enough money!"); getchar();
					}
					break;
				}
				case 2:{
					printf("How many do you want to buy ? ");scanf("%d",&buy);getchar();
					if (pdexdata[0].money >= buy*1000){
						pdexdata[0].money -=(buy*1000);
						pdexdata[0].greatpoke  += buy;
						printf("Thanks for buying!"); getchar();
					} else{
						printf("You don't have enough money!"); getchar();
					}
					break;
				}
				case 3:{
					printf("How many do you want to buy ? ");scanf("%d",&buy);getchar();
					if (pdexdata[0].money >= buy*2000){
						pdexdata[0].money -= buy*2000;
						pdexdata[0].ultrapoke  += buy;
						printf("Thanks for buying!"); getchar();
					} else{
						printf("You don't have enough money!"); getchar();
					}
					break;
				}
				case 4:{
					printf("How many do you want to buy ? ");scanf("%d",&buy);getchar();
					if (pdexdata[0].money >= buy*9999){
						pdexdata[0].money -= buy*9999;
						pdexdata[0].masterpoke  += buy;
						printf("Thanks for buying!"); getchar();
					} else{
						printf("You don't have enough money!"); getchar();
					}
					break;
				}
			}
		}while (choice <1 || choice >5);
	}while (choice !=5);
	printf("Thank you!");
}

void sellpoke(){
	int choice;
	int sell;
	do{
		do{
		cls();
		printf("Sell Pokeballs\n");
		printf("==============\n");
		printf("Money: %d\n",pdexdata[0].money );
		printf("==============\n");
		printf("1. Pokeball   | 250  | You have: %d\n",pdexdata[0].poke );
		printf("2. Greatball  | 500  | You have: %d\n",pdexdata[0].greatpoke );
		printf("3. Ultraball  | 1000 | You have: %d\n",pdexdata[0].ultrapoke );
		printf("4. Masterball | 4999 | You have: %d\n",pdexdata[0].masterpoke );
		printf("5. Exit\n");
		printf("Choose [1..5]: ");scanf("%d",&choice);getchar();
		
		switch(choice){
			case 1:{
				printf("How many do you want to sell ? ");scanf("%d",&sell);getchar();
				if(pdexdata[0].poke >=sell){
					pdexdata[0].money +=250*sell;
					pdexdata[0].poke -=sell;
					printf("Thank for selling");getchar();
				}else{
					printf("You don't have enough Pokeball!");getchar();
				}
				break;
			}
			case 2:{
				printf("How many do you want to sell ? ");scanf("%d",&sell);getchar();
				if(pdexdata[0].greatpoke  >=sell){
					pdexdata[0].money  +=500*sell;
					pdexdata[0].greatpoke  -=sell;
					printf("Thank for selling");getchar();
				}else{
					printf("You don't have enough Pokeball!");getchar();
				}
				break;
			}
			case 3:{
				printf("How many do you want to sell ? ");scanf("%d",&sell);getchar();
				if(pdexdata[0].ultrapoke  >=sell){
					pdexdata[0].money  +=1000*sell;
					pdexdata[0].ultrapoke  -=sell;
					printf("Thank for selling");getchar();
				}else{
					printf("You don't have enough Pokeball!");getchar();
				}
				break;
			}
			case 4:{
				printf("How many do you want to sell ? ");scanf("%d",&sell);getchar();
				if(pdexdata[0].masterpoke   >=sell){
					pdexdata[0].money  +=4999*sell;
					pdexdata[0].masterpoke  -=sell;
					printf("Thank for selling");getchar();
				}else{
					printf("You don't have enough Pokeball!");getchar();
				}
				break;
			}
		}
		
		} while (choice <1 || choice >5);
	}while (choice != 5);
}

void nameswitch(){
	
}

void tradepoke(){
	int x=shopsortdefault();
	x -=1;
	int choice;
	char tempname[100]={0};
	do{
		do{
			cls();
			printf("===============================\n");
			printf("| No |      Name      | Count |\n");
			printf("===============================\n");
			for (int a=1;a<=x;a++){
				printf("| %-2d | %-14s | %-5d |\n",a,pdexsort[a].pokename ,pdexsort[a].pokecount );
			}
			printf("===============================\n");
			printf("1. Sort By Count\n");
			printf("2. Sort By Name\n");
			printf("3. Trade Pokemon | 1000 each pokemon\n");
			printf("4. Exit\n");
			printf("Choose [1..4]: ");scanf("%d",&choice); getchar();
			
			switch(choice){
				case 1:{
					for (int a=1;a<=x-1;a++){
						for (int b=a+1;b<=x;b++){
							if (pdexsort[a].pokecount > pdexsort[b].pokecount ){
								strcpy(tempname,pdexsort[a].pokename);
								strcpy(pdexsort[a].pokename,pdexsort[b].pokename);
								strcpy(pdexsort[b].pokename,tempname);
								pdexsort[a].pokecount ^= pdexsort[b].pokecount ^= pdexsort[a].pokecount ^= pdexsort[b].pokecount ;
							}
						}
					}
					break;
				}
				case 2:{
					for (int a=1;a<=x-1;a++){
						for (int b=1+a;b<=x;b++)
						{
							if(strcmp(pdexsort[a].pokename,pdexsort[b].pokename) > 0){
								strcpy(tempname,pdexsort[a].pokename);
								strcpy(pdexsort[a].pokename,pdexsort[b].pokename);
								strcpy(pdexsort[b].pokename,tempname);
								pdexsort[a].pokecount ^= pdexsort[b].pokecount ^= pdexsort[a].pokecount ^= pdexsort[b].pokecount ;
							}
						}
					}
					break;
				}
				case 3:{
					int number;
					do{
						printf("Choose the pokemon you want to trade [1..%d]: ",x-1);scanf("%d",&number);getchar();
						if(pdexsort[number].pokecount ==0){
							printf("You don't have any pokemon to trade");getchar();
						}
					}while(number<=0||number>x-1);
					int amount;
					do{
						printf("How many do you want to trade [1..%d]: ",pdexsort[number].pokecount);scanf("%d",&amount);getchar();
						if (amount > pdexsort[number].pokecount ){
							printf("You don't have enough Pokemon");
						}
					}while (amount <=0 || amount >pdexsort[number].pokecount );
					pdexsort[number].pokecount -= amount;
					for(int i=0;i<30;i++){
						if(!strcmp(pdexdata[number].pokename ,pdexsort[number].pokename )){
							pdexdata[number].pokecount = pdexsort[number].pokecount ;
							break;
						}
					}
					printf("You got %d from trading your pokemon !",1000*amount);getchar();
					pdexdata[0].money += (1000*amount);
					break;
				}
			}
		}while (choice <1 || choice >4);
	}while (choice != 4);
}

void shop(){
	int menu;
	do{
		do{	
			cls();
			printf("PokeShop\n");
			printf("===========\n");
			printf("Money: %d\n",pdexdata[0].money );
			printf("===========\n");
			printf("1. Buy Pokeballs\n");
			printf("2. Sell Pokeballs\n");
			printf("3. Trade Pokemon\n");
			printf("4. Exit\n");
			printf("Choose [1..4]: "); scanf("%d",&menu); getchar();
			switch (menu){
				case 1:{
					buypoke();
					break;
				}
				case 2:{
					sellpoke();
					break;
				}
				case 3:{
					tradepoke();
					break;
				}
			}
		}while (menu <1 ||menu >4);	
	} while(menu!=4);
	printf("Thank you for coming! Please come again!"); getchar();
}


void game(){
	bool flag = false;
	char choice;
	char temp=' ';
	char final;
	do{
		cls();
		map[yPos][xPos]=pIcon;
		createmap();
		choice = getch();
		int chance;
		switch (choice){
			case 'w':{
				if (map[yPos-1][xPos] != '#'){
					map[yPos][xPos] = temp;
					yPos--;
					if (map[yPos][xPos] == 'v'){
						chance = (rand()%99)+1;
						grass(chance);
					}
					if (map[yPos][xPos] == 'S'){
						shop();
					}
					temp = map[yPos][xPos];
				}
				break;
			}
			case 's':{
				if (map[yPos+1][xPos] != '#'){
					map[yPos][xPos] = temp;
					yPos++;
					if (map[yPos][xPos] == 'v'){
						chance = (rand()%99)+1;
						grass(chance);
					}
					if (map[yPos][xPos] == 'S'){
						shop();
					}
					temp = map[yPos][xPos];
				}
				break;
			}
			case 'd':{
				if (map[yPos][xPos+1] != '#'){
					map[yPos][xPos] = temp;
					xPos++;
					if (map[yPos][xPos] == 'v'){
						chance = (rand()%99)+1;
						grass(chance);
					}
					if (map[yPos][xPos] == 'S'){
						shop();
					}
					temp = map[yPos][xPos];
				}
				break;
			}
			case 'a':{
				if (map[yPos][xPos-1] != '#'){
					map[yPos][xPos] = temp;
					xPos--;
					if (map[yPos][xPos] == 'v'){
						chance = (rand()%99)+1;
						grass(chance);
					}
					if (map[yPos][xPos] == 'S'){
						shop();
					}
					temp = map[yPos][xPos];
				}
				break;
			}
			case 'p':{
				openpdex();
				break;
			}
			case 'h':{
				help();
				break;
			}
			case 'x':{
				do{
					printf("Are you sure want to exit and save the game ? [y/n]:");
					final=getch();
					if (final != 'y' && final != 'n'){
						printf("\n");
					}
				} while (final != 'y' && final !='n');
				if (final == 'y'){
					flag=true;
				}
				break;
			}
			case 'c':{
				pinfo();
				break;
			}
			default :{
				break;
			}
		}
	}while (!flag);
	savegame();
}

int NewGame(){
	dexreader();
	printf("Welcome new adventurer, May i have your name?\n");
	validateAlphaNumeric();
	pdexdefault();
	savegame();
	pdexdefault();
	game();
	return 3;	
}

int LoadGame(){
	char loadname[20];
	int x;
	dexreader();
	printf("Aahh. Welcome back. I have forgotten your name. May I ask your name again ?\n");
	validateAlphaNumeric();
	strcpy(loadname,name);
	strcat(loadname,".txt");
	FILE *load;
	load = fopen (loadname,"r");
	if (load){
		fscanf(load,"%d#%d#%d#%d#%d\n",&pdexdata[0].money ,&pdexdata[0].poke ,&pdexdata[0].greatpoke ,&pdexdata[0].ultrapoke ,&pdexdata[0].masterpoke );
		for (int a=1;a<31;a++){
			fscanf(load,"%[^#]#%[^#]#%d#%[^\n]\n",&pdexdata[a].pokename,&pdexdata[a].poketype ,&pdexdata[a].pokecount,&pdexdata[a].pokecate);
		}
	} 
	fclose(load);
	for (int a=1;a<31;a++){
		bool flag = false;
		if (!strcmp(pdexdata[a].poketype,"???$") ){
			pdexdata[a].poketype[3] = '\0';
		} else
		{
			x = strlen(pdexdata[a].poketype );
			for (int b=0;b<x;b++)
			{
				if (pdexdata[a].poketype[b] == '$' ){
					pdexdata[a].poketype[b] = '-';
					break;
				}
			}
			if (pdexdata[a].poketype[x+1] == '\0'){
				pdexdata[a].poketype[x-1] = '\0';
			}
		}
	}
	game();
	return 3;
}


int main(){
	int choose;	
	cls();
	srand(time(NULL));
	dexreader();
	
	printf("                                                     \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                                 \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                              \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                            \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                           \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                         \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                         \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe         \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                        \xfe\xfe           \xfe\xfe         \xfe\xfe           \xfe\xfe\n");
	printf("                                        \xfe\xfe\xfe          \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe          \xfe\xfe\xfe\n");
	printf("                                         \xfe\xfe                                 \xfe\xfe\n");
	printf("                                         \xfe\xfe\xfe                               \xfe\xfe\xfe\n");
	printf("                                           \xfe\xfe\xfe                           \xfe\xfe\xfe\n");
	printf("                                            \xfe\xfe\xfe                        \xfe\xfe\xfe\xfe\n");
	printf("                                              \xfe\xfe\xfe\xfe                   \xfe\xfe\xfe\xfe\n");
	printf("                                                 \xfe\xfe\xfe\xfe\xfe\xfe         \xfe\xfe\xfe\xfe\xfe\xfe\n");
	printf("                                                     \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n\n\n\n\n");

	getchar();
	
	do{
		puts("1. New Game");
		puts("2. Load Game");
		puts("3. Exit Game");
		printf("Choose [1..3]: "); scanf("%d",&choose); getchar();
		
		if (choose == 1){
			choose = NewGame();
		}
		else if (choose == 2){
			choose = LoadGame();
		}
			cls();
			printf("                                                     \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                                 \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                              \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                            \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                           \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                         \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                         \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe         \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                        \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe  \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                        \xfe\xfe           \xfe\xfe         \xfe\xfe           \xfe\xfe\n");
			printf("                                        \xfe\xfe\xfe          \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe          \xfe\xfe\xfe\n");
			printf("                                         \xfe\xfe                                 \xfe\xfe\n");
			printf("                                         \xfe\xfe\xfe                               \xfe\xfe\xfe\n");
			printf("                                           \xfe\xfe\xfe                           \xfe\xfe\xfe\n");
			printf("                                            \xfe\xfe\xfe                        \xfe\xfe\xfe\xfe\n");
			printf("                                              \xfe\xfe\xfe\xfe                   \xfe\xfe\xfe\xfe\n");
			printf("                                                 \xfe\xfe\xfe\xfe\xfe\xfe         \xfe\xfe\xfe\xfe\xfe\xfe\n");
			printf("                                                     \xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe\n\n\n\n\n");
			
			char thanks[100]=("\tThank you for playing Adventurer! I hope to see you again soon");
			int len = strlen(thanks);
			for(int a=0;a<len;a++){
				printf("%c",thanks[a]);
				Sleep(70);
			}
			printf("\n\n");
			char nar[100]="\t\t\t\t\t\tAchieve Success Through Faith, Effort, and Teamwork";
			len = strlen(nar);
			for(int a=0;a<len;a++){
				printf("%c",nar[a]);
				Sleep(70);
			}
	} while(choose!=3);
}
