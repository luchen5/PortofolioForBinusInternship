import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Random;
import java.util.Scanner;

public class Main {
	Scanner scan = new Scanner(System.in);
	Random rand = new Random();
	Hero hero;

	int currExp;
	int currHP;
	int currGold;
	int level;
	
	private void cls() {
		for(int i = 0 ; i < 31 ; i++) {
			System.out.println();
		}

	}
	
	public Main() {
		String name;
		String job;
		int menu=0;
		do {
			cls();
			System.out.println("Champion Heroes - Rise, Hero!");
			System.out.println("=============================");
			System.out.println("1. New Game");
			System.out.println("2. Load Game");
			System.out.println("3. Exit");
			System.out.print("Choose >>");
			try {
				menu =scan.nextInt();
				scan.nextLine();
			} catch (Exception e) {
				scan.nextLine();
			}
			switch(menu) {
				case 1:{
					cls();
					do {
						System.out.println("Please enter your hero's name [5 - 25 characters]: "); name = scan.nextLine();
					}while(name.length()<5||name.length()>25);
					do {
						System.out.println("Please enter your hero's job [Warrior | Archer | Healer] [Case Sensitive]: "); job=scan.nextLine();
					}while(!job.equals("Warrior")&&!job.equals("Archer")&&!job.equals("Healer"));
					
					if(job.equals("Warrior")) {
						hero = new Hero(name,job,"Quick Slash", 22, 15, 100,100, 1, (float)2.4, (float)0.05, (float)0.06, 0, 80);
					}else if(job.equals("Archer")) {
						hero = new Hero(name,job,"Weak Point Shot", 17, 16, 80, 80, 1, (float) 1.6,(float) 0.15,(float) 0.05, 0, 80);
					}else if(job.equals("Healer")) {
						hero = new Hero(name,job,"Heal", 15, 15, 100, 100, 1, (float) 2.5, (float)0.10, (float)0.04, 0,80);
					}
					
					System.out.println("Enjoy your Journey!"); scan.nextLine();
					heromenu();
					break;
				}
				case 2:{
					load();
					heromenu();
					break;
				}
			}
		}while(menu != 3);
	}
	
	private void load() {
		Scanner file= null;
		try {
			file = new Scanner(new FileReader("SaveFile\\hero.txt"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		String[] temp=file.nextLine().split("#");
		String[] job = temp[1].split("\\.");
			hero = new Hero(temp[0], job[2], temp[6],Integer.valueOf(temp[9]), Integer.valueOf(temp[10]),Integer.valueOf(temp[7]), Integer.valueOf(temp[8]), Integer.valueOf(temp[2]), Float.valueOf(temp[13]),  Float.valueOf(temp[12]), Float.valueOf(temp[11]), Integer.valueOf(temp[4]),Integer.valueOf(temp[3]));
			file.close();
	}
	
	private void heromenu() {
		int menu =0 ;
		currExp = hero.getCurrExp();
		currHP = hero.getCurrHP();
		currGold= hero.getGold();
		level = hero.getLevel();
		boolean quit = false;
		do {
			cls();
			System.out.println("Welcome!");
			System.out.println("Your HP: "+currHP+"/"+hero.getHp());
			System.out.println("Level: "+hero.getLevel());
			System.out.println("Gold: "+currGold);
			System.out.println("Exp: "+currExp+"/"+hero.getExp());
			System.out.println("1. Travel");
			System.out.println("2. Rest (-80G)");
			System.out.println("3. Refresh");
			System.out.println("4. Save");
			System.out.println("5. Quit");
			System.out.print("Choose >>");
			try {
				menu =scan.nextInt();
				scan.nextLine();
			} catch (Exception e) {
				scan.nextLine();
			}
			switch(menu) {
				case 1:{
					quit = gameStart();
					break;
				}
				case 2:{
					System.out.print("Z"); delay(500); System.out.print("z"); delay(500); System.out.println("z"); delay(500);
					System.out.println("Health Restored!"); delay(700);
					currHP = hero.getHp();
					currGold-=80;
					break;
				}
				case 4:{
					File file = new File("SaveFile\\hero.txt");
					try {
						file.createNewFile();
						
						FileWriter writer = new FileWriter(file);
						
						writer.write(hero.getName()+"#"+"Model.Character."+hero.getJob()+"#"+level+"#"+currGold+"#"+currExp+"#"+hero.getExp()+"#"+hero.getSkill()+"#"+currHP+"#"+hero.getHp()+"#"+hero.getAttack()+"#"+hero.getDefense()+"#"+hero.getEvade()+"#"+hero.getCrit()+"#"+hero.getRegen());
						writer.flush();
						writer.close();
						
					} catch (IOException e) {
						e.printStackTrace();
					}
					System.out.println("Creating file..."); delay(500);
					System.out.println("Get hero's data..."); delay(500);
					System.out.println("Writing to file..."); delay(500);
					System.out.println("Saved!"); delay(500);
				}
			}
		}while(menu != 5&&quit==false);
	}

	private boolean gameStart() {
		int pX = 23;
		int pY = 23;
		int chance;
		String move = "";
		boolean finish=false;
		Map map = new Map();
		do {
			chance = 0;
		cls();
		map.setPlayer(pY, pX);
		map.printMap();
		System.out.print("Move [w|a|s|d|q for quit]: "); move =scan.nextLine();
		if(move.equals("w")) {
			if(map.checkPlayer(pY-1, pX)) {
				map.resetPlayer(pY, pX);
				pY-=1;
			}
		}else if(move.equals("s")) {
			if(map.checkPlayer(pY+1, pX)) {
				map.resetPlayer(pY, pX);
				pY+=1;
			}
		}else if(move.equals("d")) {
			if(map.checkPlayer(pY, pX+1)) {
				map.resetPlayer(pY, pX);
				pX+=1;
			}
		}else if(move.equals("a")) {
			if(map.checkPlayer(pY, pX-1)) {
				map.resetPlayer(pY, pX);
				pX-=1;
			}
		}else if(move.equals("q")) {
			return true;
		}
		
		if(pY==0 && pX == 2) {
			finish = true;
		}
		
		if((chance=rand.nextInt(10)+1) == 3) {
			finish = meetEnemy();
			if(finish==true) {
				return true;
			}
		}
		
		}while(finish== false);
		return false;
	}
	
	private boolean meetEnemy() {
		int menu=0;
		int atk=rand.nextInt(10);
		int def=rand.nextInt(10);
		atk = hero.getAttack() - atk;
		def = hero.getDefense() - def;
		Enemy enemy = new Enemy(atk, def, hero.getHp(), 5, 7);
		int currEHP = enemy.getHp();
		boolean player = true;
		boolean finish = false;
		int skill = 0;
		boolean pDef = false;
		boolean eDef = false;
		do {
			if(player) {
				cls();
				System.out.println("Your Turn!");
				pDef=false;
				delay(700);
				do {
					cls();
					System.out.println("Your HP: "+currHP+"/"+hero.getHp()+"                Enemy HP: "+currEHP);
					System.out.println(" ");
					System.out.println("Your turn!");
					System.out.println("1. Attack");
					System.out.println("2. Use "+hero.getSkill()+"(Cooldown: "+skill+")");
					System.out.println("3. Defend");
					System.out.println("4. Escape");
					System.out.print("Choose >>");
					try {
						menu =scan.nextInt();
						scan.nextLine();
					} catch (Exception e) {
						scan.nextLine();
					}
					switch(menu) {
						case 1:{
							int crit = (int)(hero.getCrit()*100);
							int chance = rand.nextInt(100)+1;
							int eEvade = enemy.getEvade();
							int miss = rand.nextInt(100)+1;
							if(eEvade<=miss) {
								if(chance <= crit) {
									int damage = 0;
									if(eDef) {
										damage = (hero.getAttack()*2) - (rand.nextInt(enemy.getDefense())+5);
									}else {
										damage = (hero.getAttack()*2) - rand.nextInt(enemy.getDefense());
									}	
									currEHP -= damage;
									System.out.println("You use Attack");
									System.out.println("Critical!");
									System.out.println("You inflict damage: "+damage); delay(700);
								}else {
									int damage =0;
									if(eDef) {
										damage = (hero.getAttack()) - (rand.nextInt(enemy.getDefense())+5);
									}else {
										damage = (hero.getAttack()) - rand.nextInt(enemy.getDefense());
									}
									currEHP -= damage;
									System.out.println("You use Attack");
									System.out.println("You inflict damage: "+damage); delay(700);
								}
							}else {
								System.out.println("You Missed!"); delay(300);
							}
							player = false;
							break;
						}
						case 2:{
							if(skill==0) {
								int crit = (int)(hero.getCrit()*100);
								int chance = rand.nextInt(100)+1;
								int eEvade = enemy.getEvade();
								int miss = rand.nextInt(100)+1;
								if(hero.getJob().equals("Warrior")) {
									if(eEvade<=miss) {
										if(chance <= crit) {
											int damage = 0;
											if(eDef) {
												damage = (hero.getAttack()*5/2) - (rand.nextInt(enemy.getDefense())+5);
											}else {
												damage = (hero.getAttack()*5/2) - rand.nextInt(enemy.getDefense());
											}
											
											currEHP -= damage;
											System.out.println("You use "+hero.getSkill());
											System.out.println("Critical!");
											System.out.println("You inflict damage: "+damage); delay(700);
										}else {
											int damage = 0;
											if(eDef) {
												damage = (hero.getAttack()*3/2) - (rand.nextInt(enemy.getDefense())+5);
											}else {
												damage = (hero.getAttack()*3/2) - rand.nextInt(enemy.getDefense());
											}
											currEHP -= damage;
											System.out.println("You use "+hero.getSkill());
											System.out.println("You inflict damage: "+damage); delay(700);
										}
									}else {
										System.out.println("You Missed!");
									}
								}else if(hero.getJob().equals("Archer")) {
									if(eEvade<=miss) {
										if(chance <= crit) {
											int damage = 0;
											if(eDef) {
												damage = (hero.getAttack()*2) - (rand.nextInt(enemy.getDefense())+5);
											}else {
												damage = (hero.getAttack()*2) - rand.nextInt(enemy.getDefense());
											}
											currEHP -= damage;
											System.out.println("You use "+hero.getSkill());
											System.out.println("Critical!");
											System.out.println("You inflict damage: "+damage); delay(700);
										}else {
											int damage = 0;
											if(eDef) {
												damage = (hero.getAttack()) - (rand.nextInt(enemy.getDefense())+5);
											}else {
												damage = (hero.getAttack()) - rand.nextInt(enemy.getDefense());
											} 
											currEHP -= damage;
											System.out.println("You use "+hero.getSkill());
											System.out.println("You inflict damage: "+damage); delay(700);
										}
										int defense = enemy.getDefense() - 5 ;
										enemy.setDefense(defense);
									}else {
										System.out.println("You Missed!"); delay(700);
									}
								}else if(hero.getJob().equals("Healer")) {
									int heal = hero.getLevel()*80/7;
									currHP += heal;
									System.out.println("You use "+hero.getSkill());
									System.out.println("Healed "+heal+" hp(s)"); delay(700);
								}
								player = false;
								skill = 3;
							}else {
								System.out.println("Skill Cooldown!"); delay(700);
							}
							break;
						}
						case 3:{
							pDef=true;
							if(hero.getJob().equals("Warrior")) {
								int heal = (hero.getLevel()/7)*7;
								currHP +=heal;
							}
							player = false;
							break;
						}
						case 4:{
							System.out.println("You Escaped!"); delay(700);
							finish = true;
							break;
						}
					}
					if(currEHP <= 0) {
						cls();
						System.out.println("You Win!");
						int gold = rand.nextInt(21) + 40;
						int exp =rand.nextInt((5*hero.getLevel()))+5;
						System.out.println("You gained "+gold+"gold(s)");
						System.out.println("You gained "+exp+"exp(s)"); delay(700);
						currGold += gold;
						currExp += exp;
						checkLevel();
						return false;
					}
				}while(menu < 1 || menu > 4);
			}else {
				if(skill!=0) {
					skill--;
				}
				player =true;
				int what = rand.nextInt(100)+1;
				eDef=false;
					if(what >=65){
						int crit = (int)(enemy.getCrit());
						int chance = rand.nextInt(100)+1;
						int pEvade = (int)(hero.getEvade()*100);
						int miss = rand.nextInt(100)+1;
						if(pEvade<=miss) {
							if(chance <= crit) {
								int damage =0;
								if(pDef) {
									damage = (enemy.getAttack()*2) - (rand.nextInt(hero.getDefense())+5);
								}else {
									damage = (enemy.getAttack()*2) - rand.nextInt(hero.getDefense());
								}
								currHP -= damage;
								System.out.println("Enemy use Attack");
								System.out.println("Critical!");
								System.out.println("Enemy inflict damage: "+damage); delay(700);
							}else {
								int damage=0;
								if(pDef) {
									damage = (enemy.getAttack()) - (rand.nextInt(hero.getDefense()+5));
								}else {
									damage = (enemy.getAttack()) - rand.nextInt(hero.getDefense());
								}
								currHP -= damage;
								System.out.println("Enemy use Attack");
								System.out.println("Enemy inflict damage: "+damage); delay(700);
							}
						}else {
							System.out.println("Enemy Missed!"); delay(700);
						}
					}else {
						eDef=true;
						System.out.println("Enemy Defense!"); delay(700);
					}
					if(currHP<=0) {
						System.out.println("You Lose!"); delay(700);
						return true;
					}
			}
		}while(finish == false);
		return false;
	}
	
	private void checkLevel() {
		if(currExp >= hero.getExp()) {
			cls();
			System.out.println("You Leveled Up!");
			level++;
			hero.setLevel(level);
			hero.setExp(hero.getLevel()*200);
			hero.setHp(hero.getHp()+10);
			hero.setAttack(hero.getAttack()+2);
			hero.setDefense(hero.getDefense()+2);
			hero.setCrit((float)(hero.getCrit()+0.01));
			hero.setEvade((float)(hero.getEvade()+0.01));
			hero.setRegen(hero.getRegen()+2);
			currHP = hero.getCurrHP();
			currExp = 0;
			delay(700);
		}
	}
	
	private void delay(int time) {
		try{
			Thread.sleep(time);
		}catch (Exception e){}
	}
	
	public static void main(String[] args) {
		new Main();
	}

}
