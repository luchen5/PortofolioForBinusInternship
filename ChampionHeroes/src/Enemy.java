
public class Enemy {
	
	int attack;
	int defense;
	int hp;
	int crit;
	int evade;
	
	public Enemy() {
		// TODO Auto-generated constructor stub
	}

	public Enemy(int attack, int defense, int hp, int crit, int evade) {
		super();
		this.attack = attack;
		this.defense = defense;
		this.hp = hp;
		this.crit = crit;
		this.evade = evade;
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

	public int getHp() {
		return hp;
	}

	public void setHp(int hp) {
		this.hp = hp;
	}

	public int getCrit() {
		return crit;
	}

	public void setCrit(int crit) {
		this.crit = crit;
	}

	public int getEvade() {
		return evade;
	}

	public void setEvade(int evade) {
		this.evade = evade;
	}
	
	

}
