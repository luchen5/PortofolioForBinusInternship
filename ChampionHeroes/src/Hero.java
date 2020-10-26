
public class Hero {
	String name;
	String job;
	String skill;
	int attack;
	int defense;
	int currHP;
	int hp;
	int level;
	float regen;
	float crit;
	float evade;
	int currExp;
	int exp;
	int gold;

	

	public Hero(String name, String job, String skill, int attack, int defense, int currHP, int hp, int level,
			float regen, float crit, float evade, int currExp, int gold) {
		super();
		this.name = name;
		this.job = job;
		this.skill = skill;
		this.attack = attack;
		this.defense = defense;
		this.currHP = currHP;
		this.hp = hp;
		this.level = level;
		this.regen = regen;
		this.crit = crit;
		this.evade = evade;
		this.currExp = currExp;
		this.exp = level*200;
		this.gold = gold;
	}

	

	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getJob() {
		return job;
	}



	public void setJob(String job) {
		this.job = job;
	}



	public String getSkill() {
		return skill;
	}



	public void setSkill(String skill) {
		this.skill = skill;
	}



	public int getAttack() {
		return attack;
	}



	public void setAttack(int attack) {
		this.attack = attack;
	}



	public int getDefense() {
		return defense;
	}



	public void setDefense(int defense) {
		this.defense = defense;
	}



	public int getCurrHP() {
		return currHP;
	}



	public void setCurrHP(int currHP) {
		this.currHP = currHP;
	}



	public int getHp() {
		return hp;
	}



	public void setHp(int hp) {
		this.hp = hp;
	}



	public int getLevel() {
		return level;
	}



	public void setLevel(int level) {
		this.level = level;
	}



	public float getRegen() {
		return regen;
	}



	public void setRegen(float regen) {
		this.regen = regen;
	}



	public float getCrit() {
		return crit;
	}



	public void setCrit(float crit) {
		this.crit = crit;
	}



	public float getEvade() {
		return evade;
	}



	public void setEvade(float evade) {
		this.evade = evade;
	}



	public int getCurrExp() {
		return currExp;
	}



	public void setCurrExp(int currExp) {
		this.currExp = currExp;
	}



	public int getExp() {
		return exp;
	}



	public void setExp(int exp) {
		this.exp = exp;
	}



	public int getGold() {
		return gold;
	}



	public void setGold(int gold) {
		this.gold = gold;
	}



	public Hero() {
		// TODO Auto-generated constructor stub
	}

}
